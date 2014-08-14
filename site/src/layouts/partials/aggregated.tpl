<ol class="toc">
<% _.each(categories, function(category, name) { %>
  <li>
    <a href="#<%- _.str.slugify(name) %>"><%- name %></a>
    <ol>
      <% _.each(category, function(section) { %>
      <li>
        <a href="#<%- section.id %>"><%- section.title %></a>
      </li>
      <% }) %>
    </ol>
  </li>
<% }); %>
</ol>

<% _.each(categories, function(category, name) { %>
  <section id="<%- _.str.slugify(name) %>">
    <header>
      <h2><%- name %></h2>
    </header>
    <% _.each(category, function(section) { %>

    <div>
      <section id="<%- section.id %>">
        <header>
          <h3><%- section.title %></h3>
        </header>

        <div>
          <%= section.body %>
        </div>
        <% /*
        <footer></footer>
        */ %>
      </section>
    </div>

    <% }); %>
  </section>
<% }); %>
