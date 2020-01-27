<template>
  <footer>
    <div class="container">
      <div class="row">
        <div class="footer-sitemap col-md-4">
          <span class="footer-header">Sitemap</span>
          <div class="row">
            <div class="col-md-6">
              <ul>
                <li>
                  <router-link replace :to="{ path: router() }">About</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('ontology') }">FIBO Viewer</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('FIBO-Groups') }">FIBO Groups</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('how-to-contribute') }">How to contribute</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('FIBO-Release-Notes') }">Release notes</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('OWL') }">FIBO OWL</router-link>
                </li>                               
              </ul>
            </div>
            <div class="col-md-6">
              <ul>
                <li>
                  <router-link replace :to="{ path: router('vocabulary') }">FIBO vocabulary</router-link>
                </li>                 	
                <li>
                  <router-link replace :to="{ path: router('data-dictionary') }">FIBO data dict.</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('courses') }">FIBO courses</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('use-cases') }">FIBO use cases</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('schema') }">FIBO schema.org</router-link>
                </li>
                <li>
                  <router-link replace :to="{ path: router('FIB-DM') }">FIBO FIB-DM</router-link>
                </li>
              </ul>
            </div>

            <!-- end content -->
          </div>
          <!-- end row -->
        </div>
        <!-- end footer-sitemap -->
        <div class="footer-contact col-md-3">
          <span class="footer-header">Contact Us</span>
          <ul>
            <li class="mail">
              <a href="mailto:info@edmcouncil.org">info@edmcouncil.org</a>
            </li>
            <li class="phone">
              USA +1
              <span style="color: #ffffff;">(646) 722-4381</span>
            </li>
            <li class="phone">UK +44 (0) 1794 390044</li>
          </ul>
        </div>
        <!-- end footer-contact -->
      </div>
      <hr />
      <div class="row">
        <div class="col-md-8">
          <p>
            © 2020 EDM Council. All rights reserved. DCAM and FIBO are registered trademarks of EDM Council.
            All other marks are the property of their respective owners. Membership Management Software Powered by
            YourMembership
          </p>

          <div class="footer-links">
            <ul>
              <li>
                <a
                  href="https://cdn.ymaws.com/edmcouncil.org/resource/resmgr/Featured_Documents/Legal/EDMC__Terms_of_Use_032318.pdf"
                  target="_blank"
                  v-on:click="outboundClick('EDMC__Terms_of_Use_032318.pdf')"
                >Terms of Use</a>
              </li>
              <li>
                <a
                  href="https://cdn.ymaws.com/edmcouncil.org/resource/resmgr/Featured_Documents/Legal/EDMC_Privacy_Policy_032318.pdf"
                  target="_blank"
                  v-on:click="outboundClick('EDMC_Privacy_Policy_032318.pdf')"
                >Privacy Policy</a>
              </li>
              <li>
                <a
                  href="https://cdn.ymaws.com/edmcouncil.org/resource/resmgr/Featured_Documents/Legal/EDMC_Copyright_Policy_032318.pdf"
                  target="_blank"
                  v-on:click="outboundClick('EDMC_Copyright_Policy_032318.pdf')"
                >Copyright</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-4">
          <div class="footer-social-links">
            <ul>
              <li class="twitter">
                <a
                  href="https://twitter.com/edmcouncil"
                  target="_blank"
                  v-on:click="outboundClick('twitter')"
                ></a>
              </li>
              <li class="linkedin">
                <a
                  href="https://www.linkedin.com/company/edm-council/"
                  target="_blank"
                  v-on:click="outboundClick('linkedin')"
                ></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
import helpers from '../store/helpers.js';
import { outboundClick } from '../helpers/ga';

export default {
  extends: helpers,
  name: 'Footer',
  methods: {
    outboundClick,
  },
};
</script>

<style lang="scss">
footer {
  background-color: map-get($colors-map, "blue");
  padding: 40px 0;

  a {
    color: map-get($colors-map, "white");
  }
  a:hover {
    color: map-get($colors-map, "orange");
  }
  p {
    font-size: 12px;
    color: #fff;
  }
  .footer-text {
    padding: 30px 0;
    color: map-get($colors-map, "white");
    font-weight: 300;
    font-size: 14px;
  }
  li:before {
    border: 0 !important;
  }
  span.footer-header {
    margin: 0px;
    padding: 0px;
    display: inline-block;
    padding-bottom: 12px;
    font-weight: 600;
    font-size: 24px;
    color: map-get($colors-map, "white");
  }
  ul {
    margin: 0;
    padding: 0;
  }
  li {
    line-height: 20px;
    padding-left: 0;
    font-size: 15px;
  }
  .footer-contact {
    ul {
      margin-left: 12px;

      li {
        list-style-type: none;
        font-size: 15px;
        color: map-get($colors-map, "white");
        text-decoration: none;
        height: 50px;
        line-height: 50px;
        border-bottom: 1px map-get($colors-map, "white") dotted;

        a {
          color: map-get($colors-map, "white");
        }

        &.mail a {
          display: block;
          padding-left: 33px;
          font-size: 15px;
          color: map-get($colors-map, "white");
          text-decoration: none;
          background: url(//edmcouncil.site-ym.com/resource/resmgr/images/Homepage_Images/bgr_footer_contact_mail.png)
            no-repeat left 15px;
        }
        &.phone {
          padding-left: 33px;
          background: url(//edmcouncil.site-ym.com/resource/resmgr/images/Homepage_Images/bgr_footer_contact_phone.png)
            no-repeat left 15px;
        }
        &:last-child {
          border-bottom: 0;
        }
      }
    }
  }

  .footer-sitemap ul {
    border-left: 1px dotted map-get($colors-map, "white");
    padding-left: 10px;
  }

  .footer-links ul {
    font-size: 12px;
    list-style-type: none;
    padding: 20px 0;
    margin: 0;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    li {
      padding: 0;
      margin: 0;
      line-height: 12px;
      font-size: 12px;

      &:first-child {
        border-right: 1px solid map-get($colors-map, "white");
        padding-right: 12px;
      }
      &:nth-child(2) {
        border-right: 1px solid map-get($colors-map, "white");
        padding-right: 12px;
        padding-left: 12px;
      }
      &:nth-child(3) {
        padding-left: 12px;
      }
    }
  }

  .footer-social-links ul {
    margin: 0px;
    padding: 0px;
    text-align: right;

    li {
      list-style-type: none;
      display: inline-block;
      margin-left: 4px;

      &.twitter a {
        display: block;
        width: 54px;
        height: 54px;
        background: url(//edmcouncil.site-ym.com/resource/resmgr/images/Homepage_Images/footer_twitter.png)
          no-repeat left top;
      }
      &.linkedin a {
        display: block;
        width: 54px;
        height: 54px;
        background: url(//edmcouncil.site-ym.com/resource/resmgr/images/Homepage_Images/footer_linkedin.png)
          no-repeat left top;
      }
    }
  }
}
</style>
