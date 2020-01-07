<template>
  <div id="app">
    <Header></Header>
    <Carousel v-if="!$route.meta.plainLayout"></Carousel>
    <router-view/>
    <Footer></Footer>
  </div>
</template>
<script>
import Header from '@/components/Header.vue';
import Carousel from '@/components/Carousel.vue';
import Footer from '@/components/Footer.vue';

export default {
  components: {
    Header,
    Carousel,
    Footer,
  },
};
</script>


<style lang="scss">

form {
  width: 500px;
  background: white;
  padding: 20px 25px;
  margin: auto;
  margin-top: 30px;
  box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2);
  clear: both;

    input,
    textarea {
      font: inherit;
      padding: 5px 5px;
      width: 100%;
      margin-top: 3px;
      margin-bottom: 15px;
      box-sizing: border-box;
        }
    button {
      border: 1px solid rgba(0, 0, 0, 0.2);
      padding: 8px 35px;
      font-size: 12px;
      background: map-get($colors-map, 'grey');
      color: white;
    }
    label {
      color: map-get($colors-map, 'grey');
      font-size: 11px;
      margin-bottom: 2px;
      display: block;
    }
}

hr {
  border-width: 1px;
  border-color: map-get($colors-map, 'white');
  margin-top: 20px;
  margin-bottom: 20px;
}

.fibo-logo{
  border: 1px solid map-get($colors-map, 'medium-grey');
  float: left;
  padding: 20px;
  margin: 0 40px 40px 0;
}
.fill-image-site {
  width: 324px;
  height: 388px;
  background: url("./assets/img/fill.png") no-repeat;
  position: absolute;
  top: 40%;
  left: 10%;
}
.fill-image-fibo {
  width: 324px;
  height: 388px;
  background: url("./assets/img/fill.png") no-repeat;
  position: absolute;
  top: 40%;
  left: 10%;
}

@media (max-width: 1559px) {
  .fill-image-fibo {
    display: none;
  }
}
@media (max-width: 575px) {
  li {
    padding-left: 0;
  }
  body {
    word-wrap: break-word;
    overflow-wrap: break-word;
  }
}
</style>
