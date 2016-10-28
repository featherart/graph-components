`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'globe-graph', 'Integration | Component | globe graph', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{globe-graph}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#globe-graph}}
      template block text
    {{/globe-graph}}
  """

  assert.equal @$().text().trim(), 'template block text'
