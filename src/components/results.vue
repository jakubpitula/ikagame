<template>
	<div class="row main-form-container justify-content-center align-items-center">
		<div class="col-12 col-md-7 col-lg-5 align-self-center">
			<div class="row justify-content-center align-items-center">
				<div class="points col-7 align-self-center ">
					<h1 v-text="points" :class="pointsTextStyle"></h1>
				</div>
			</div>
			<div class="row justify-content-center align-items-center">
				<div class="form col-12 align-self-center">
					<table class="table">
						<thead>
    						<tr>
      							<th scope="col">Imie</th>
      							<th scope="col">Nazwisko</th>
   	 						</tr>
  						</thead>
						<tbody>
							<tr :class="{'table-danger': !obj.correct}" :key="obj" v-for="obj in resultsObj">
								<td>{{obj.imie}}</td>
								<td>{{obj.nazwisko}}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
export default {
  name: "results",
  props: ["resultsObj"],
  computed: {
    points: function() {
      let counter = 0;
      for (let res in this.resultsObj) if (res.correct) counter++;
      return (100 / 32 * counter).toFixed(1) + " %";
    }
  }
};
</script>
<style scoped>
.points {
  max-width: 350px;
}
.points h1 {
  font-weight: 300;
  font-size: 3rem;
  font-family: Raleway;
  padding-top:50px;
  padding-bottom:30px;
}
.main-form-container {
  height: calc(100% - 60px);
}
.form {
  margin-top: 50px;
  margin-bottom:10%;
}
</style>
