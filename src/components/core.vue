<template>
	<div class="row main-form-container justify-content-center align-items-center">
		<div class="col-11 col-sm-9 col-md-7 col-lg-5 align-self-center">
			<div class="row justify-content-center align-items-center">
				<div id="imgContainer" class="img-container col-9 col-sm-7 align-self-center ">
					<transition name="imganim" mode="out-in">
					<img id="img" :key="imagesrc" :src="imagesrc" class="img">
					</transition>
				</div>
			</div>
			<div class="row justify-content-center align-items-center">
				<div class="form col-12 col-md-10 align-self-center" @keyup.enter="submit">
					<input v-model="imie" placeholder="Imię" id="imie" class="form-control" type="text">
					<input v-model="nazwisko" placeholder="Nazwisko" id="nazwisko" class="form-control" type="text">
					<button @click="submit" class="btn btn-primary btn-block">Następne</button>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	name: "core",
	props: ["bus", "aliasesObj"],
	data() {
		return {
			context: this,
			person: { imie: "", nazwisko: "", addr: "", counter:0 },
			imie: "",
			nazwisko: "",
			imagesrc: ""
		};
  },
  methods: {
		format: function(string) {
			string = string.trim().toLowerCase();
			return string.charAt(0).toUpperCase() + string.slice(1);
		},
		checkAlias: function(test, original) {
			if (test == original) return true;
			let ret = false;
			this.aliasesObj.forEach(obj => {
				if (this.format(obj.alias) == test && this.format(obj.index) == original)	{
					ret = true;
					return;
				}
			});
			return ret;
		},
		submit: function() {
			let check = false;
			this.imie = this.format(this.imie);
			this.nazwisko = this.format(this.nazwisko);
			this.person.imie = this.format(this.person.imie);
			this.person.nazwisko = this.format(this.person.nazwisko);
			if(this.checkAlias(this.imie, this.person.imie) && this.nazwisko == this.person.nazwisko)
				check = true;
			this.$emit("submit", {
				correct: check,
				imie: this.imie,
				nazwisko: this.nazwisko,
				imie_poprawne: this.person.imie,
				nazwisko_poprawne: this.person.nazwisko
			});
		},
		updateImage: function() {
			fetch("/img/" + this.person.addr, { mode: "cors" })
			.then(
				response => {
					if(response.ok)
						return response.blob();
					else{
						console.warn("Couldn't load image: " + "/img/" + this.person.addr);
						throw "Image not found";
					}
				},
				err => {
					throw new Error("Image fetch failed: " + err);
				}
			)
			.then(
				blob => {
					let imgaddr = window.URL.createObjectURL(blob);
					this.imagesrc = imgaddr;
				},
				err => {
					this.imagesrc = "";
					throw new Error("There was a problem with the BLOB resource: " + err);
				}
			);
			this.imie = "";
			this.nazwisko = "";
			document.getElementById("imie").focus();
		},
		saveData:function(){
		 console.log(this.person.counter);
			if(this.person.counter <= 32)
				localStorage.setItem("last-person", JSON.stringify(this.person));
	 }
	},
	mounted: function() {
		this.bus.$on("update", obj => {
			this.person = obj;
			this.updateImage();
		});
		window.addEventListener("resize", ()=>{
			document.getElementById("imgContainer").style.height = getComputedStyle(document.getElementById("imgContainer")).width;
		});
		let context = this;
		window.addEventListener("beforeunload", this.saveData);
		document.getElementById("imgContainer").style.height = getComputedStyle(document.getElementById("imgContainer")).width;
		this.$emit("loaded");
  	}
};
</script>
<style scoped>
.img-container {
  max-width: 320px;
	padding:0;
	max-height: 40vh;
}
.main-form-container {
  height: calc(100vh - 60px);
}
.img {
  border-radius: 50%;
  max-width: 100%;
  max-height: 100%;
  width: auto;
  height: auto;
}
.form > input[type="text"] {
  width: calc(100% - 20px);
  border-radius: 7px;
  margin: 10px;
}
.form {
  margin-top: 50px;
  margin-bottom: 20%;
}
.imganim-enter-active, .imganim-leave-active {
  transition: all 280ms;
	transition-property: transform, opacity, width, height;
}
.imganim-enter-active {
  transition-timing-function: cubic-bezier(0.21, 1, 0.69, 1.47);
}
.imganim-leave-active {
  transition-timing-function: cubic-bezier(.31,-0.47,.79,0);
}
.imganim-enter-to, .imganim-leave {
  opacity: 1;
	transform: scale(1);
}
.imganim-enter, .imganim-leave-to{
  opacity: 0;
	transform: scale(0.2);
}
</style>
