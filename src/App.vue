<template>
	<div id="app" class="app-container container-fluid">
		<progress_ :value ="prog"/>
		<transition name="fade">
		<core v-if="core_display" :bus="bus" :aliasesObj="aliasesObj" @submit="process" @loaded="getData"/>
		<results v-if="results_display" :resultsObj="results" />
		<div v-if="!ready_" class="spinner">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
		</transition>
	</div>
</template>

<script>
import Vue from 'vue'
import core from './components/core'
import progress_ from './components/progress'
import results from './components/results'
export default {
	name: 'App',
	data(){
		return{
			bus:new Vue(),
			prog:0,
			results:[],
			aliasesObj: [],
			results_display:false,
			ready_:false
		}
	},
	components: {
		core,
		progress_,
		results
	},
	methods:{
		displayResults:function(){
			this.results_display = true;
			document.cookie.split(";").forEach(function(c) { document.cookie = c.replace(/^ +/, "").replace(/=.*/, "=;expires=" + new Date().toUTCString() + ";path=/"); });
		},
		setData:function(obj){
			this.ready_ = true;
			this.prog = (100/32)*(obj.counter - 1);
			this.bus.$emit('update', obj);
			if(obj.counter > 32)
				this.displayResults();
		},
		getData:function(){
			let component = this;
			fetch("/api/", {method: 'GET', credentials: 'include'}).then(function(res){
				if(res.ok){
					res.clone().json().then(
						js=>{component.setData(js)}, 
						err=>{
						res.text().then(text => {throw new Error("Error with the JSON: " + err + "\n\nResponse from server:\n" + text);
						});
					});
				} else {
					res.text().then(text => {throw new Error("Error getting data. Response code was not ok :c\n\nResponse from server:\n" + text)});
				}
			}, function(err){
				throw new Error("Fetch failed: " + err);
			});
		},
		process: function(obj){
			this.results.push(obj);
			this.getData();
		}
	},
	computed:{
		core_display:function(){
			return (this.ready_ && !this.results_display);
		}
	},
	mounted:function(){
		let context = this;
		fetch("/api/aliases.json", {method: "GET", credentials: "include"}).then(
        function(res) {
          if (res.ok) {
            res.clone().json().then(
                js => {
				  context.aliasesObj = js;
				  context.ready_ = true;
                },
                err => {
                  res.text().then(text => {
                    console.warn("(aliases) Error with the JSON: " + err + "\n\nResponse from server:\n" + text);
                  });
                }
              );
          } else {
            res.text().then(text => {
              console.warn("(aliases) Error getting data. Response code was not ok :c\n\nResponse from server:\n" + text);
            });
          }
        },
        function(err) {
          console.warn("(aliases) Fetch failed: " + err);
        }
      );
		
	}
}

</script>

<style>
#app {
	font-family: 'Avenir', Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-align: center;
	color: #2c3e50;
	margin:0;
	min-height:100vh;
}
.loader-icon {
	display: block;
	position: absolute;
	top:50%;
	left:50%;
	transform:translate(-50%, -50%);
	width: 100px;
	height: 100px;

}
.spinner {
	width: 70px;
	text-align: center;
	position:fixed;
	top:50%;
	left:50%;
	transform:translate(-50%, -50%);
	transition-delay:0ms!important;
}

.spinner > div {
	width: 18px;
	height: 18px;
	background-color: #0077df;

	border-radius: 100%;
	display: inline-block;
	-webkit-animation: sk-bouncedelay 1.4s infinite ease-in-out both;
	animation: sk-bouncedelay 1.4s infinite ease-in-out both;
}

.spinner .bounce1 {
	-webkit-animation-delay: -0.32s;
	animation-delay: -0.32s;
}

.spinner .bounce2 {
	-webkit-animation-delay: -0.16s;
	animation-delay: -0.16s;
}

@-webkit-keyframes sk-bouncedelay {
	0%, 80%, 100% { -webkit-transform: scale(0) }
	40% { -webkit-transform: scale(1.0) }
}

@keyframes sk-bouncedelay {
	0%, 80%, 100% { 
		-webkit-transform: scale(0);
		transform: scale(0);
	} 40% { 
		-webkit-transform: scale(1.0);
		transform: scale(1.0);
	}
}
.fade-enter-active, .fade-leave-active {
	transition: opacity .5s;
	transition-delay:0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
	opacity: 0;
}
</style>
