`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'bar-graph', 'Integration | Component | bar graph', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{bar-graph}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#bar-graph}}
      template block text
    {{/bar-graph}}
  """

  assert.equal @$().text().trim(), 'template block text'
