<template>
    <div class="row main-form-container justify-content-center align-items-center">
        <div class="col-10 col-md-7 col-lg-5 align-self-center">
            <div class="row justify-content-center align-items-center">
                <div class="img-container col-7 align-self-center ">
                    <img :src="imagesrc" :class="{collapsed: imageCollapsed}" class="img">
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
      imageCollapsed: true
    };
  },
  methods: {
    checkAlias: function(test, original) {
	  	if (test == original) return true;
	  	for (let obj in this.aliasesObj) if (obj.alias == test && obj.index == original) return true;
      	return false;
    },
    submit: function() {
      let check = false;
      if (this.checkAlias(this.imie, this.person.imie) && this.nazwisko == this.person.nazwisko)
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
      this.imageCollapsed = true;
      fetch(this.person.addr, { mode: "cors" })
        .then(
          response => response.blob(),
          err => {
            throw new Error("Image fetch failed: " + err);
          }
        )
        .then(
          blob => {
            let imgaddr = window.URL.createObjectURL(blob);
			this.imagesrc = imgaddr;
			this.imie = "";
			this.nazwisko = "";
            this.imageCollapsed = false;
          },
          err => {
            throw new Error("Something with the blob: " + err);
          }
        );
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
  height: calc(100% - 60px);
}
.img {
  border-radius: 50%;
  max-width: 100%;
  max-height: 100%;
  transition: transform 300ms;
  width: auto;
  height: auto;
}
.collapsed {
  transform: scale(0);
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
</style>
