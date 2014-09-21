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
      .charge(-200)
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
            .duration(250)
            .attr("r", 24)
        )
        .on("mouseout", ->
          d3.select(this).select("circle").transition()
            .duration(250)
            .attr("r", 16)
        )
        .call(force.drag)

    node.append("circle")
      .attr("r", 16)
      .attr "fill", (d) ->
        if d.weight <= 1
          return "#27ae60"
        else if d.weight > 2 && d.weight <= 4
          return "#f1c40f"
        else if d.weight > 4 && d.weight <= 10
          return "#e67e22"
        else
          return "#c0392b"

    node.append("text")
      .attr("x", 12)
      .attr("dy", ".35em")
      .text (d) ->
        console.log d
        return d.name

    node.append("text")
      .attr('fill', '#ffffff')
      .attr("x", -2)
      .attr("dy", -1)
      .text (d) -> return d.weight

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