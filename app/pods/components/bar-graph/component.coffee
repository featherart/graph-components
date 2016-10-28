`import Ember from 'ember'`

BarGraphComponent = Ember.Component.extend(
  tagName: 'div'
  yAxisText: ''
  height: 400
  width: 500

  # initial animation time
  duration: 1500

  # reduce size of y scale numbers by this factor
  # yScale: 100
  # to make a scatter plot type visual give this a bigger value than yScale
  # barSize: 100
  # to shorten x-axis values set this amount
  # abbreviate: 2
  # to set a uniform color set this
  # colorString = rgb( v, v, v)

  didInsertElement: ->
    # necessary placement params
    margin = {top: 20, right: 20, bottom: 30, left: 40}
    width = @get('width') - margin.left - margin.right
    height = @get('height') - margin.top - margin.bottom

    # optional params
    yScale = @get('yScale')
    barSize = @get('barSize')
    abbreviate = @get('abbreviate')
    colorString = @get('colorString')
    duration = @get('duration')

    x = d3.scale.ordinal().rangeRoundBands([0, width], .1)

    y = d3.scale.linear()
        .range([height, 0])

    xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")

    yAxis = d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(@dataset.dataset.data.length, "")

    svg = d3.select(".bar-graph").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

    # SET X AXIS LABELS
    # ANY ALTERATION OF THE VALUE FOR d.name MUST MATCH d.name BELOW
    # OR DATA WILL NOT BE MATCHED TO THE RIGHT COLUMN
    x.domain(@dataset.dataset.data.map((d) ->
      return d.name.slice(0,abbreviate) if abbreviate
      return d.name
    ))
    # SET Y AXIS LABELS
    # ANY ALTERATION OF THE VALUE FOR d.value MUST MATCH d.value BELOW
    # OR DATA WILL NOT BE MATCHED WITH THE CORRECT HEIGHT
    y.domain([0, d3.max(@dataset.dataset.data, (d) ->
      return d.value / yScale if yScale
      return d.value
    )])

    svg.append("g")
        .attr("class", "xAxis")
        .attr("transform", "translate(0,#{height})")
        .call(xAxis)

    svg.append("g")
        .attr("class", "yAxis")
        .call(yAxis)
        .append("text")
        .style("text-anchor", "middle")
        .text(@get('yAxisText'))

    svg.selectAll(".bar")
        .data(@dataset.dataset.data)
        .enter().append("rect")
        .attr("height", 0)
        .transition()
        .duration(duration).ease("bounce")
        .attr("class", "bar")
        .attr("x", (d) ->
            # shorten name here
            return x(d.name.slice(0,abbreviate)) if abbreviate
            return x(d.name)
        )
        .attr("width", x.rangeBand())
        .attr("y", (d) ->
          return y(d.value / yScale) if yScale
          return y(d.value)
          )
        .attr("height", (d) ->
          return height - y(d.value / barSize) if barSize
          return height - y(d.value)
        )
        # create a random scale of colors for bars
        # for a uni-colored chart use the CSS property
        .attr("fill", (d) ->
          return colorString if colorString
          r = Math.floor(Math.random() * 256)
          b = Math.floor(Math.random() * 256)
          g = Math.floor(Math.random() * 256)
          # this makes a pretty blue-green mix
          "rgb( 5, #{g}, 150)"
        )

  didDestroyElement: ->
    console.log 'need to figure this out'

)
`export default BarGraphComponent`
