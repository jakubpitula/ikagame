<template>
	<div class="row main-form-container justify-content-center align-items-center">
		<div class="col-10 col-md-7 col-lg-5 align-self-center">
			<div class="row justify-content-center align-items-center">
				<div class="img-container col-7 align-self-center ">
					<transition name="imganim" @before-enter="animationActive = true" @after-leave="animationActive = false">
					<img id="img" :key="imagesrc" :src="imagesrc" class="img" @load="displayImage">
					</transition>
				</div>
			</div>
			<div class="row justify-content-center align-items-center">
				<div class="form col-10 align-self-center">
					<input v-model="imie" placeholder="Imię" id="imie" class="form-control" type="text">
					<input v-model="nazwisko" placeholder="Nazwisko" id="nazwisko" class="form-control" type="text">
					<button @click="submit" class="btn btn-primary btn-block">Next</button>
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
			person: { imie: "", nazwisko: "", addr: "" },
			imie: "",
			nazwisko: "",
			imagesrc: "",
			animationActive: false,
			imageActive: false
		};
  },
  methods: {
		displayImage: function(){
			this.imageActive = true;
		},
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
			this.imageActive = false;
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
					if(document.getElementById("img").complete) this.displayImage();
				},
				err => {
					this.imagesrc = "";
					throw new Error("There was a problem with the BLOB resource: " + err);
				}
			);
			this.imie = "";
			this.nazwisko = "";
		}
 	},
	mounted: function() {
		this.bus.$on("update", obj => {
			this.person = obj;
			this.updateImage();
		});
		this.$emit("loaded");
  	}
};
</script>
<style scoped>
.img-container {
  max-width: 350px;
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
  transition: all 270ms;
	transition-property: transform, opacity, width, height;
}
.imganim-enter-active {
  transition-timing-function: ease-in;
}
.imganim-leave-active {
  transition-timing-function: ease-out;
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
