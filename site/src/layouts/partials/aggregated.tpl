<% _.each(categories, function(category, name) { %>
  <% var categoryId = _.str.slugify(name); %>
  <section id="<%- categoryId %>">
    <header>
      <h2>
        <%- name %>
        <a class="anchor" href="#<%- categoryId %>" title="Link to current section">¶</a>
      </h2>
    </header>
    <% _.each(category, function(section) { %>

    <div>
      <section id="<%- section.id %>" data-page="<%- section.path %>">
        <header>
          <h3>
            <%- section.title %>
            <a class="anchor" href="#<%- section.id %>" title="Link to current section">¶</a>
          </h3>
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
