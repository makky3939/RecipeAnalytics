@users_relation = ->
  d3.json 'users_relation_json', (error, data) ->
    console.log data
    nodes = {}

    data.forEach (link) ->
      link.source = nodes[link.source] || (nodes[link.source] = {name: link.source})
      link.target = nodes[link.target] || (nodes[link.target] = {name: link.target})
      0

    width = $('h2').width()
    height = $('h2').width()

    force = d3.layout.force()
      .nodes(d3.values(nodes))
      .links(data)
      .size([width, height])
      .linkDistance(60)
      .charge(-300)
      .start()

    svg = d3.select("#users_relation").append("svg")
      .attr("width", width)
      .attr("height", height)

    link =
      svg.selectAll(".link")
        .data(force.links())
      .enter().append("line")
        .attr("class", "link")

    node =
      svg.selectAll(".node")
        .data(force.nodes())
      .enter().append("g")
        .attr("class", "node")
        .on("mouseover", ->
          d3.select(this).select("circle").transition()
            .duration(750)
            .attr("r", 16)
        )
        .on("mouseout", ->
          d3.select(this).select("circle").transition()
            .duration(750)
            .attr("r", 8)
        )
        .call(force.drag)

    node.append("circle")
      .attr("r", 8)

    node.append("text")
      .attr("x", 12)
      .attr("dy", ".35em")
      .text (d) -> return d.name

    force.on "tick", ->
      link
        .attr("x1", (d) -> return d.source.x )
        .attr("y1", (d) -> return d.source.y )
        .attr("x2", (d) -> return d.target.x )
        .attr("y2", (d) -> return d.target.y )
      node
        .attr("transform", (d) -> return "translate(" + d.x + "," + d.y + ")" )
      0
    0
  0