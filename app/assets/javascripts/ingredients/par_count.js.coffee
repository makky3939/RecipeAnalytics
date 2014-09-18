@par_count = ->
  values =
    d3.range 1000
      .map d3.random.bates 10

  formatCount =
    d3.format ',.0f'

  margin =
    top: 10
    right: 30
    bottom: 30
    left: 30

  width =
    960 - margin.left - margin.right

  height =
    500 - margin.top - margin.bottom

  x =
    d3.scale.linear()
      .domain [0, 1]
      .range [0, width]

  data =
    d3.layout.histogram().bins(x.ticks(20))(values)

  y =
    d3.scale.linear()
      .domain [0, d3.max(data, (d)-> d.y)]
      .range [height, 0]

  xAxis =
    d3.svg.axis()
      .scale x
      .orient 'bottom'

  svg =
    d3.select("#par_count").append('svg')
      .attr 'width', parseInt(width + margin.left + margin.right)
      .attr 'height', parseInt(height + margin.top + margin.bottom)
      .append 'g'
        .attr 'transform', 'translate(' + margin.left + ',' + margin.top + ')'

  bar =
    svg.selectAll '.bar'
      .data data
    .enter().append 'g'
      .attr 'class', 'bar'
      .attr 'transform', (d) -> 'translate(' + x(d.x) + ',' + y(d.y) + ')'

  bar.append 'rect'
    .attr 'x', 1
    .attr 'width', x(data[0].dx) - 1
    .attr 'height', (d) -> height - y(d.y)

  bar.append 'text'
    .attr 'dy', '.75em'
    .attr 'y', 6
    .attr 'x', x(data[0].dx) / 2
    .attr 'text-anchor', 'middle'
    .text (d) -> formatCount(d.y)

  svg.append 'g'
    .attr 'class', 'x axis'
    .attr 'transform', 'translate(0,' + height + ')'
    .call xAxis

  return 0