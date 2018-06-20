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
  props: ["bus"],
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
      if (test === original) return true;
      let aliasesObj;
      fetch("/api/aliases.json", {method: "GET", credentials: "include"}).then(
        function(res) {
          if (res.ok) {
            res.clone().json().then(
                js => {
                  aliasesObj = js;
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
      if (aliasesObj != undefined) {
        for (obj in aliasesObj) {
          if (obj.alias == test && obj.index == original) return true;
        }
      }
      return false;
    },
    submit: function() {
      let check = false;
      if (checkAlias(this.imie, this.person.imie) && this.nazwisko == this.person.nazwisko)
        check = true;
      this.$emit("submit", {
        correct: check,
        imie: this.person.imie,
        nazwisko: this.person.nazwisko
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
<style>
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
