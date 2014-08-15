<div class="breadcrumb-fixed-top">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <ol class="breadcrumb">
          <li>
            <a href="<%- page.basePath %>">Home</a>
          </li>

          <% if (page.parents) { _.each(page.parents, function(parent, index) { %>
          <li>
            <a href="<%- page.basePath %><%- parent.url %>"><%- parent.title %></a>
          </li>
          <% }); } %>

          <li>
            <a href="."><%- page.title %></a>
          </li>
        </ol>
      </div>
    </div>
  </div>
</div>
