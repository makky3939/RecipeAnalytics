@recipe_post_calendar = ->
  day = d3.time.format '%w'
  week = d3.time.format '%U'
  percent = d3.format '.1%'
  format = d3.time.format '%Y-%m-%d'

  color = d3.scale.linear().domain([1, 2000]).range(['#acacac', '#343434'])
  cellSize = 17

  width = $('h2').width()
  height = 172

  monthPath = (t0) ->
    t1 = new Date(t0.getFullYear(), t0.getMonth() + 1, 0)
    d0 = +day(t0)
    w0 = +week(t0)
    d1 = +day(t1)
    w1 = +week(t1)
    return 'M' + (w0 + 1) * cellSize + ',' + d0 * cellSize + 'H' + w0 * cellSize + 'V' + 7 * cellSize + 'H' + w1 * cellSize + 'V' + (d1 + 1) * cellSize + 'H' + (w1 + 1) * cellSize + 'V' + 0 + 'H' + (w0 + 1) * cellSize + 'Z'

  d3.json 'post_calendar_json', (json) ->
    data = d3.nest()
      .key (d) ->
        d.date
      .map json.recipes
    console.info data

    svg = d3.select('#post_calendar').selectAll 'svg'
      .data d3.range('2010', '2015')
      .enter().append 'svg'
      .attr {
        'width': width
        'height': height
      }
      .append 'g'
      .attr 'transform', 'translate(' + ((width - cellSize * 53) / 2) + ',' + (height - cellSize * 7 - 1) + ')'

    svg.append 'text'
      .attr('transform', 'translate(-6,' + cellSize * 3.5 + ')rotate(-90)')
      .style('text-anchor', 'middle')
      .text (d) -> d

    rect = svg.selectAll '.day'
      .data (d) ->
        d3.time.days(new Date(d, 0, 1), new Date(d + 1, 0, 1))
      .enter().append 'rect'
        .attr {
          'class': 'day'
          'width': cellSize
          'height': cellSize
          'x': (d) -> week(d) * cellSize
          'y': (d) -> day(d) * cellSize
          'fill': '#fff'
          'stroke': '#eee'
          'stroke-width': '1px'
        }
        .datum format

    rect.append 'name'
      .text (d) ->
        d

    rect.attr 'fill', (d) ->
      if data[d] != undefined
        return color data[d].length
      else
        return '#fff'

    svg.selectAll '.month'
      .data (d) ->
        d3.time.months(new Date(d, 0, 1), new Date(d + 1, 0, 1))
      .enter()
      .append 'path'
      .attr {
        'class': 'month'
        'fill': 'none'
        'stroke': '#ccc'
        'stroke-width': '2px'
      }
      .attr 'd', monthPath
  0