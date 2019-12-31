<template>
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light">
      <a class="navbar-brand" href="https://edmcouncil.org" target="_blank">
        <img id="logo-fibo" src="@/assets/img/logo.png">
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        MENU
        <span class="navbar-toggler-icon"></span>
      </button>
      <ul class="navbar-links">
        <li>
          <a href="https://edmcouncil.org/events/event_list.asp" target="_blank">CALENDAR</a>
        </li>
        <li>
          <a href="https://edmcouncil.org/Login.aspx" target="_blank">GO TO EDMCONNECT</a>
        </li>
        <li>
          <a href="https://edmcouncil.org/login.aspx" target="_blank">SIGN IN</a>
        </li>
        <li>
          <a href="https://edmcouncil.org/page/NewWebReg" target="_blank">REGISTER</a>
        </li>
        <li class="ico">
          <a href="https://twitter.com/edmcouncil" target="_blank" class="foot-li">
            <i class="fab fa-twitter"></i>
          </a>
        </li>
        <li class="ico">
          <a href="https://www.linkedin.com/company/edm-council/" target="_blank" class="foot-li">
            <i class="fab fa-linkedin-in"></i>
          </a>
        </li>
        <li class="ico">
          <a href="https://www.youtube.com/edmcouncil" target="_blank" class="foot-li">
            <i class="fab fa-youtube"></i>
          </a>
        </li>
      </ul>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <router-link class="nav-link" replace :to="{ path: router() }">About</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" replace :to="{ path: router('ontology') }">FIBO VIEWER</router-link>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >Documentation</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <router-link class="dropdown-item" replace :to="{ path: router('FIBO-Groups') }">FIBO Groups</router-link>
              <!-- <router-link class="dropdown-item" replace :to="{ path: router('development-process') }">Development process</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('') }">Ontology guide</router-link> -->
              <router-link class="dropdown-item" replace :to="{ path: router('how-to-contribute') }">How to contribute</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('FIBO-Release-Notes') }">FIBO Release Notes</router-link>              
            </div>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >Products</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <router-link class="dropdown-item" replace :to="{ path: router('OWL') }">FIBO OWL ontology</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('vocabulary') }">FIBO SKOS vocabulary</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('data-dictionary') }">FIBO data dictionary</router-link>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >EDUCATION</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <router-link class="dropdown-item" replace :to="{ path: router('courses') }">Courses</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('use-cases') }">Use cases</router-link>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >EXTERNAL</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <router-link class="dropdown-item" replace :to="{ path: router('schema') }">FIBO SCHEMA.ORG</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('FIB-DM') }">FIB-DM</router-link>
            </div>
          </li>
          <!-- <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >?</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <router-link class="dropdown-item" replace :to="{ path: router('contact') }">Contact</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('ontology-tools') }">Dedicated ontology tools</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('SMIF-UML') }" >SMIF/UML Diagrams for FIBO</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('development') }">FIBO Development Process</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('working-group') }">FIBO Working Groups</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('products') }">All FIBO Products</router-link>
              <router-link class="dropdown-item" replace :to="{ path: router('schema') }">FIBO extension to schema.org</router-link>
            </div>
          </li> -->
        </ul>
      </div>
    </nav>
  </div>
</template>

<script>
import helpers from '../store/helpers.js';

export default {
  extends: helpers,
  name: 'header',
};
</script>


<style lang="scss">

.fab {
  font-family: $font-family-awsome-brands;
  font-style: normal;
}
.fa-linkedin-in:before {
  content: "\f0e1";
}
.fa-twitter:before {
  content: "\f099";
}
.fa-youtube:before {
  content: "\f167";
}

.padding-top30-bottom30 {
  padding: 30px 0;
}
.navbar {
  padding: 0;
  li {
    border-bottom: 0;
    padding: 0;
    letter-spacing: 0;
  }
}
.nav-item {
  text-transform: uppercase;
  font-weight: 600;
}
.navbar-nav {
  align-self: flex-end;
  padding-bottom: 5px;
  margin-top: 45px;
  margin-bottom: 12px;
}
.navbar-collapse {
  padding-top: 40px;
}
.navbar-nav li:before,
.navbar-links li:before {
  border: none !important;
}
.navbarfibo {
  align-self: end;
  justify-content: flex-end;
  padding-bottom: 15px;
  font-weight: 700;
}
.navbar-brand img {
  margin-top: 15px;
}
.navbar-expand-lg .navbar-nav .nav-link {
  padding: 2px 0 2px 30px;
  font-size: 18px;
  font-weight: 500;
  color: map-get($colors-map, 'blue');
  text-shadow: 0 0 1px #ccc;
}
.nav-link {
  transition: 0.5s;

  &:focus,
  &:active {
    outline: none !important;
    box-shadow: none;
  }
}
.navbar-light .navbar-toggler {
  margin-top: 40px;
  color: map-get($colors-map, 'white');
  border-color: transparent;
  line-height: 20px;
}
.navbar-toggler {
  background-color: map-get($colors-map, 'orange');
  font-size: 15px;
}
.navbar-light .navbar-toggler-icon {
  background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3e%3cpath stroke='rgba(255, 255, 255, 1)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}
.navbar-links {
  position: absolute;
  top: 25px;
  right: 0;
  list-style-type: none;
  padding: 0;
  margin: 0;

  li{
    display: inline-block;
    background-color: map-get($colors-map, 'orange');
    text-decoration: none;
    white-space: nowrap;
    margin: 0 3px;
    padding: 0;
    transition: 0.3s;
    vertical-align: top;
    line-height: 34px;
    height: 34px;
  &:hover {
    background-color: map-get($colors-map, 'blue');
  }
  &:nth-child(4) {
    margin-right: 40px;
  }
    a {
      color: map-get($colors-map, 'white');
      font-size: 12px;
      font-weight: 500;
      line-height: 33px;
      text-transform: uppercase;
      padding: 0 15px;
      line-height: 36px;

      &:hover {
        text-decoration: none;
      }
    }
    &.edm-logo {
      background-color: transparent;
    }
    &.edm-logo {
      background-color: transparent;
    }
    &.ico {
      background-color: map-get($colors-map, 'white');
      margin: 0 0;

      a {
        padding: 0;
        font-size: 22px;
      }
      i {
        display: inline-block;
        margin-top: 60px;
        background-color: map-get($colors-map, 'medium-grey');
        color: map-get($colors-map, 'white');
        border-radius: 100%;
        line-height: 40px;
        height: 40px;
        width: 40px;
        text-align: center;
        margin: 0 1px;
        font-size: 22px;
        transition: all 0.6s ease 0s;

        &:hover {
          background-color: map-get($colors-map, 'lighter-grey');
          color: map-get($colors-map, 'blue');
        }

      }
    }
  }
}


.dropdown-menu {
  border: none;
  background-color: map-get($colors-map, 'blue');
  border-radius: 0;
}
.dropdown-item {
  color: #fff;
  padding: 2px 12px;
  font-size: 18px;
  font-weight: 400;
  text-transform: capitalize;
  line-height: 24px;

  &:hover, &:focus {
    text-decoration: none;
    background-color: map-get($colors-map, 'blue');
    color: #fff;
  }
}

.ml-auto {
  left: auto !important;
  right: 0px;
}
@media (max-width: 1559px) {
  #logo-fibo {
    width: 140px;
    margin-top: 43px;
  }
  .navbar-nav {
    margin-bottom: 7px;
  }
}
@media (max-width: 1199px) {
  .navbar-expand-lg .navbar-nav .nav-link {
    padding-left: 18px;
    padding-right: 0;
    font-size: 14px;
  }
  .navbar-links li {
    height: 29px;
    line-height: 29px;
  }
  .navbar-links li a {
    padding: 0 10px;
    line-height: 29px;
  }
}
@media (max-width: 991px) {
  #logo-fibo {
    margin-bottom: 20px;
  }
}
@media (max-width: 767px) {
  .navbar-brand img {
    margin-top: 40px;
    width: 260px;
  }
  #logo-fibo {
    margin-bottom: 10px;
  }
  .carousel-caption.d-none {
    display: block !important;
    margin-top: -30px;
  }

  .navbar-links li:nth-child(4) {
    margin-right: 0;
  }
  .navbar-links li.ico {
    display: none;
  }
  .navbar-links li {
    height: 23px;
    line-height: 18px;
    margin: 0 1px;
  }
  .navbar-links li a {
    padding: 0 7px;
    font-size: 10px;
    line-height: 14px;
  }
}
@media (max-width: 575px) {
  .navbar-brand img {
    margin-top: 80px;
  }
  .navbar-links {
    top: 5px;
    right: 0;
    margin-left: -20px;
  }

}

</style>
