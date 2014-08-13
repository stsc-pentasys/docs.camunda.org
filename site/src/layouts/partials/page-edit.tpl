<%
var used = ['title', 'body', 'location'];
var defaultFields = _.uniq(page.vars.concat(['description', 'author']));
%>
<form role="form"
      class="form-horizontal"
      method="post"
      view-page-form>
  <input type="hidden" name="location" value="<%- page.location %>" />

  <div class="form-group col-md-12">
    <label for="edit-title">Title:</label>
    <input id="edit-title"
           name="title"
           placeholder="Title of the page"
           value="<%= _.str.trim(page.title) %>"
           type="text"
           class="form-control" />
  </div>


  <div class="form-group col-md-12">
    <div class="row">
      <% _.forEach(defaultFields, function(varName) {
        if (used.indexOf(varName) >= 0) {
          return;
        } %>
      <div class="col-md-6 field field-<%- _.str.slugify(varName) %>">
        <label for="edit-<%- varName %>">
          <%- _.str.capitalize(_.str.humanize(varName)) %>:
        </label>
        <input id="edit-<%- varName %>"
               name="<%- varName %>"
               placeholder="TODO: placeholders"
               value="<%= _.str.trim(page[varName]) %>"
               type="text"
               class="form-control" />
      </div>
      <% }) %>
    </div>
  </div>



  <div class="form-group col-md-12">
    <div class="row">
      <div class="col-md-6">
        <label for="edit-body">Body:</label>
        <textarea id="edit-body"
                  name="body"
                  class="form-control"
                  preview=".preview-wrapper"
                  view-code-editor><%= _.str.trim(page.body) %></textarea>
      </div>

      <div class="col-md-6">
        <label>Preview:</label>
        <div class="preview-wrapper"></div>
      </div>
    </div>
  </div>



  <div class="form-group col-md-12 action text-right">
    <button value="abort"
            class="btn btn-link"
            type="button">Abort</button>
    <button value="save"
            class="btn btn-primary"
            type="submit">Save</button>
  </div>


</form>
