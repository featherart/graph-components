`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'donut-graph', 'Integration | Component | donut graph', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{donut-graph}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#donut-graph}}
      template block text
    {{/donut-graph}}
  """

  assert.equal @$().text().trim(), 'template block text'
