<template>
  <div id="app" class="app-container container-fluid">
    <progress_ ref="coreInstance" :value ="prog"/>
    <core  v-if="ready_" :bus="bus" @btnclicked="process" @loaded="initialize"/>
  </div>
</template>

<script>
import Vue from 'vue'
import core from './components/core'
import progress_ from './components/progress'
export default {
  name: 'App',
  data(){
    return{
      bus:new Vue(),
      prog:0,
      ready_:false
    }
  },
  components: {
    core,
    progress_
  },
  methods:{
    setData:function(obj){
      this.ready_ = true;
      this.bus.$emit('update', obj);
    },
    getData:function(){
      let component = this;
      fetch("http://aplikacjejs.fc.pl/test_data").then(function(res){
        return res.json();
      }, function(err){
        alert("oops " + err);
      }).then(function(js){
        component.setData(js);
      });
      //alert("sent");
    },
    process: function(obj){
      this.getData();
      this.prog+=3.125;
    },
    initialize:function(){
      //alert("in");
      this.getData();
    }
  },
  mounted:function(){
    this.getData();
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
  height:100vh;
}
</style>
