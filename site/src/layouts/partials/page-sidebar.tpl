<div class="col-md-3 docs-sidebar affix" data-spy="affix">
  <% if (page.searchable) { %>
  <div class="search docs-sidenav">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search Docs" />
      <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
    </div>
  </div>
  <% } %>


  <ul class="nav docs-sidenav">
    <% _.each(categories, function(category, name) { %>
      <li>
        <a href="#<%- _.str.slugify(name) %>"><%- name %></a>
        <ul>
          <% _.each(category, function(section) { %>
          <li>
            <a href="#<%- section.id %>"><%- section.title %></a>
          </li>
          <% }) %>
        </ul>
      </li>
    <% }); %>
  </ul>
</div>
