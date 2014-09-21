@recipe_with_frequency = ->
  margin =
    top: 0
    right: 0
    bottom: 0
    left: 0

  width = $('h2').width() - margin.left - margin.right
  height = $('h2').width() - margin.top - margin.bottom
 
  force =
    d3.layout.force()
      .gravity 0.1
      .charge((d, i) -> d.size * -1 )
      .size [width, height]
 
  color = d3.scale.category10()
  
  svg = d3.select("#with_frequency")
    .append "svg"
    .attr "width", width + margin.left + margin.right
    .attr "height", height + margin.top + margin.bottom
    .append "g"
      .attr "transform", "translate(" + margin.left + "," + margin.top + ")"
  
  d3.json 'with_frequency_json', (error, data) ->
    console.table data.values
    data.values.forEach (d) ->
      d.name = d[0]
      d.size = d[1]
      false
    false

    force
      .nodes(data.values)
      .start()
      false
        
    node =
      svg.selectAll("g.node")
        .data(data.values)
        .enter()
        .append("g")
          .attr("class", "node")
          .call(force.drag)

    node.append("circle")
      .attr("r", (d) ->
        size = d.size * .1
        size = 60 if size > 60
        size
      )
      .attr("opacity", 1)
      .attr('class', 'item')
      .attr "fill", (d) ->
        if d.size <= 80
          return "#27ae60"
        else if d.size > 80 && d.size <= 90
          return "#f1c40f"
        else if d.size > 90 && d.size <= 100
          return "#e67e22"
        else
          return "#c0392b"

    node.append("text")
      .text((d) -> return d.name)
        .attr('fill', '#acacac')
        .attr('font-size', 3)
        .attr('dx', -5)
        .attr('dy', -5)
        .attr('class', 'item-name')

    node.append("text")
      .text((d) -> return d.size / 10 )
      .attr('fill', '#fff')
      .attr('font-size', 4)
      .attr('dx', -2)
      .attr('dy', 1)

    force.on "tick", ->
      node
        .attr('transform', (d) -> return 'translate('+ Math.max(20, Math.min(width-20, d.x)) + ',' + Math.max(20, Math.min(height-20, d.y)) + ')')
        false
      false
  0