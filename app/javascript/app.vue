<template>

  <div id="app">
    <div class="progress" v-show="progress">
      <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">Working ...</div>
    </div>
    <nav class="navbar navbar-expand-md" role="navigation">
      <a class="navbar-brand" href="/">Stanford Libraries</a>
    </nav>
    <header class="masthead row">
      <div class="col-sm-4 col-md-4 col-xl-4 media">
        <h1 class="site-title media-body">Rialto <span class="badge badge-pill badge-light">BETA</span></h1>
      </div>
      <div class="col-md-4 col-xl-5 d-none d-md-block">
      </div>
      <div class="col-sm-4 col-md-3 col-xl-2 d-none d-md-block">
        <Types/>
      </div>
    </header>
    <nav class="navbar navbar-expand-md navbar-dark subnav" role="navigation">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item"><router-link :to="{ name: 'home'}" class="nav-link">Analytics</router-link></li>
        <li class="nav-item"><router-link :to="{ name: 'search'}" class="nav-link">Browse</router-link></li>
        <li class="nav-item"><router-link :to="{ name: 'about'}" class="nav-link">About</router-link></li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="mailto:rialto-contact@lists.stanford.edu?Subject=RIALTO" target="_top">Feedback</a></li>
      </ul>
    </nav>
    <router-view></router-view>
    <footer class="footer">
      <div class="nav-link">Note: This is an internal Stanford system and data should be considered confidential. <a href="mailto:rialto-contact@lists.stanford.edu?Subject=RIALTO" target="_top">Contact us</a> to use the data publicly.</div>
    </footer>
  </div>
</template>

<script>
import Types from 'rialto/types'
export default {
  components: {
    Types
  },
   data: function () {
        return {
            progress: false
        }
    },
    created: function () {
        this.$root.$on('progress-start', () => {
            this.progress = true
        })

        this.$root.$on('progress-stop', () => {
            this.progress = false
        })
    },
}
</script>

<style lang="scss">
  @import './app.scss';

  // Our own local variables
  $masthead-background: $cardinal;
  $masthead-color: $white;

  .navbar {
    padding-top: 0.1rem;
    padding-bottom: 0.3rem;
    line-height: 1;
    padding-left: 7px;
  }
  .navbar-brand {
    background: transparent url(/StanfordLibraries-logo-cmyk.png) no-repeat bottom left;
    overflow: hidden; // don't show the text in the link tag
    text-indent: 100%; // Push the real text off the display, but leave it available for screen readers
    min-width: 180px; // Allows the whole logo to display regardless of the text in the link tag
  }
  .masthead {
    font-family: 'Source Serif Pro', serif;
    height: 100px;
    text-transform: uppercase;
    background-color: $masthead-background;
    color: $masthead-color;
    .site-title {
      font-size: 300%;
      padding-top: 1.5rem;
      padding-left: 1.5rem;
      padding-right: 1.5rem;
      font-weight: 200;
      .badge {
        font-family: 'Source Sans Pro', sans-serif;
      }
    }
  }

  .subnav {
    background-color: $subnav-background;
    .navbar-nav {
      margin-left: 0.5rem;
      .nav-link {
        font-weight: bold;
      }
    }
  }

  .footer {
    bottom: 0;
    width: 100%;
    background-color: $subnav-background;
    line-height: 1;
    margin-top: 2rem;
    padding-top: 0.1rem;
    padding-bottom: 0.3rem;
    padding-left: 7px;
    .nav-link {
      font-size: 1rem;
      color: #fff;
    }

  }
  .navbar {
  }
</style>
