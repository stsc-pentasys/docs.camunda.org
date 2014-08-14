<header class="navbar navbar-default navbar-fixed-top" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".docs-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand ir" href="<%- page.basePath %>./">docs.camunda.org</a>
    </div>

    <nav class="collapse navbar-collapse docs-navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li class="dropdown" data-active-link="<%- page.basePath %>guides">
          <a href="<%- page.basePath %>guides/">Guides</a>
          <ul class="dropdown-menu">
            <li data-active-link="<%- page.basePath %>guides/getting-started-guides">
              <a href="<%- page.basePath %>guides/getting-started-guides/">Getting Started Guides</a>
            </li>
            <li data-active-link="<%- page.basePath %>guides/user-guide">
              <a href="<%- page.basePath %>guides/user-guide/">User Guide</a>
            </li>
            <li data-active-link="<%- page.basePath %>guides/installation-guide">
              <a href="<%- page.basePath %>guides/installation-guide/">Installation Guide</a>
            </li>
            <li data-active-link="<%- page.basePath %>guides/migration-guide">
              <a href="<%- page.basePath %>guides/migration-guide/">Migration Guide</a>
            </li>
          </ul>
        </li>

        <li class="dropdown" data-active-link="<%- page.basePath %>api-references">
          <a href="<%- page.basePath %>api-references/">References</a>
          <ul class="dropdown-menu">
            <li data-active-link="<%- page.basePath %>api-references/bpmn20">
              <a href="<%- page.basePath %>api-references/bpmn20/">
                BPMN 2.0 (Implementation)
              </a>
            </li>
            <li data-active-link="<%- page.basePath %>api-references/cmmn10">
              <a href="<%- page.basePath %>api-references/cmmn10/">
                CMMN 1.0 (Implementation)
              </a>
            </li>
            <li data-active-link="<%- page.basePath %>api-references/rest">
              <a href="<%- page.basePath %>api-references/rest/">REST API</a>
            </li>
            <li data-active-link="<%- page.basePath %>api-references/javadoc">
              <a href="<%- page.basePath %>api-references/javadoc/">Javadoc</a>
            </li>
            <li data-active-link="<%- page.basePath %>api-references/deployment-descriptors">
              <a href="<%- page.basePath %>api-references/deployment-descriptors/">
                Deployment Descriptors
              </a>
            </li>
          </ul>
        </li>

        <li class="dropdown" data-active-link="<%- page.basePath %>real-life">
          <a href="<%- page.basePath %>real-life/">Real-Life</a>
          <ul class="dropdown-menu">
            <li data-active-link="<%- page.basePath %>real-life/examples">
              <a href="<%- page.basePath %>real-life/examples/">Examples</a>
            </li>
            <li data-active-link="<%- page.basePath %>real-life/how-to">
              <a href="<%- page.basePath %>real-life/how-to/">Tutorials &amp; How-Tos</a>
            </li>
          </ul>
        </li>
        <li class="dropdown" data-active-link="<%- page.basePath %>enterprise">
          <a href="<%- page.basePath %>enterprise/">Enterprise</a>
        </li>
      </ul>

      <a class="navbar-brand navbar-right back-to-main ir" href="http://camunda.org">back to camunda.org</a>

      <form class="navbar-form navbar-version navbar-right" role="switch-docs-version">
        <div class="form-group">
          <select onchange="window.location.href = this.value" style="margin: 6px">

            <option value="../latest" selected="selected">Latest</option>

            <option value="../7.0">7.0 (stable)</option>

            <option value="../7.1">7.1 (stable)</option>

          </select>
        </div>
      </form>
    </nav>
   </div>
</header>
