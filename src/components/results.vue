<template>
	<div class="row main-form-container justify-content-center align-items-center">
		<div class="col-12 col-md-7 col-lg-5 align-self-center">
			<div class="res-container row justify-content-center align-items-center" :class="{'pad':!resultsExpanded}">
				<div class="points col-10 col-md-7 align-self-center ">
					<h1 v-text="points" :class="pointsTextStyle"></h1>
					<button type="button" class="btn dropdown-toggle" :class="{'btn-outline-primary':!resultsExpanded, 'btn-primary':resultsExplained}" @click="resultsExpanded = !resultsExpanded">
    					Szczegóły <span class="caret"></span>
  					</button>
				</div>
			</div>
			<transition name="fade">
			<div v-show="resultsExpanded" class="row justify-content-center align-items-center">
				<div class="form col-12 align-self-center">
					<table class="table">
						<thead>
    						<tr>
      							<th scope="col">Odpowiedź</th>
      							<th scope="col">Poprawne</th>
   	 						</tr>
  						</thead>
						<tbody>
							<tr :key="obj" v-for="obj in resultsObj">
								<td :class="{'green': obj.correct, 'red':!obj.correct}">{{obj.imie}} {{obj.nazwisko}}</td>
								<td>{{obj.imie_poprawne}} {{obj.nazwisko_poprawne}}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</transition>
		</div>
	</div>
</template>
<script>
export default {
  name: "results",
  props: ["resultsObj"],
  data() {
		return {
			resultsExpanded: false
		};
  },
  computed: {
    points: {
      cache: false,
      get() {
        let counter = 0;
        this.resultsObj.forEach(res => {if (res.correct) counter++});
        return (100 / 32 * counter).toFixed(1) + " %";
      }
    }
  }
};
</script>
<style scoped>
.res-container{
	margin-top:0px;
	margin-bottom:0px;
	transition: all 300ms;
}
.points {
  max-width: 350px;
}
.btn{
	width:100%;
}
.points h1 {
  font-weight: 100;
  font-size: 55px;
  font-family: Roboto;
  padding-top: 0;
  padding-bottom: 30px;
}
.main-form-container {
  min-height: calc(100vh - 60px);
}
.form {
  margin-top: 50px;
  margin-bottom: 10%;
}
.green{
	color:#43A047;
}
.red {
	color:#E64A19;
}
.pad{
	padding-bottom:95px;
}
.fade-enter-active, .fade-leave-active {
	transition: opacity 300ms;
}
.fade-enter, .fade-leave-to {
	opacity: 0;
}
@media screen and (min-width:500px){
	.points h1{
		font-size: 65px;
	}
	.pad{
		padding-bottom:90px;
	}
	.res-container{
		margin-top:40px;
		margin-bottom:10px;
	}
}
@media screen and (min-width:1300px){
	.points h1{
		font-size: 80px;
	}
	.pad{
		padding-bottom:70px;
	}
	.res-container{
		margin-top:55px;
		margin-bottom:30px;
	}
}
</style>
