<!DOCTYPE html>
<html class="no-js">
<head>
  <!-- meta -->
  <meta charset="utf-8" />

  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <meta name="viewport" content="width=device-width" />

  <meta name="description" content="<%- page.description %>" />
  <meta name="author" content="<%- page.author %>" />

  <title><%- page.title %></title>

  <!-- ie6-8 support of html5 elements -->
  <!--[if lt IE 9]>
    <script async src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <!--
  <base href="<%- page.basePath %>">
 -->

  <link rel="stylesheet" href="/styles/styles.css">

  <!-- favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="/app/img/favicon.ico" />
</head>
<body data-spy="scroll" data-target=".docs-sidebar" >
  <%= page.header %>


  <%= page.breadcrumbs %>

  <div class="container">
    <div class="row">
      <%= page.sidebar %>

      <div class="col-md-<%- (page.sidebar ? '9 col-md-offset-3' : 12) %>">
        <div class="document-header">
          <h1><%= page.title %></h1>
        </div>

        <%= page.body %>
      </div>
    </div>
  </div>


  <%= page.footer %>
</body>
</html>
