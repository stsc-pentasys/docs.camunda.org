
<!--
  <script  src="/assets/vendor/jquery/jquery.min.js"></script>
  <script  src="/assets/vendor/raphaeljs/raphael.js"></script>
  <script  src="/assets/vendor/camunda/bpmn/Executor.js"></script>
  <script  src="/assets/vendor/camunda/cabpmn/cabpmn.js"></script>
  <script  src="/assets/vendor/google-code-prettify/prettify.min.js"></script>
  <script  src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
  <script  src="/assets/vendor/jquery/scrollTo/jquery.scrollTo.js"></script>
  <script  src="/assets/vendor/jquery/typeahead/typeahead.jquery.js"></script>
  <script  src="/app/js/application.js"></script>
-->

  <script type="text/javascript">var siteMenu = <%= JSON.stringify(navigation, null, 2) %>;</script>
  <script src="/scripts/index.js"></script>

  <!-- scripts -->
  <script>
    !function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (!d.getElementById(id)) {
        js = d.createElement(s);
        js.id = id;
        js.async=true;
        js.defer='defer';
        js.src = "//platform.twitter.com/widgets.js";
        fjs.parentNode.insertBefore(js, fjs);
      }
    }(document, "script", "twitter-wjs");
  </script>
