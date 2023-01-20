const diCaprioBirthYear = 1974;
const age = function(year) { return year - diCaprioBirthYear}
const today = new Date().getFullYear()
const ageToday = age(today)

// ----------------------------------------------------------
const width = 900
const height = 700
const margin = {top: 10, bottom:100, left:40, right:10}

//Svg and grups:
const svg = d3.select("div#chart").append("svg").attr("width", width).attr("height", height)
const elementGroup = svg.append("g").attr("id", "elementGroup") .attr("transform", `translate(${margin.left}, ${margin.top})`)

//Axis:
const axisGroup = svg.append("g").attr("id", "axisGroup")
const xAxisGroup = axisGroup.append("g").attr("id", "xAxisGroup").attr("transform", `translate(${margin.left}, ${height - margin.bottom})`)
const yAxisGroup = axisGroup.append("g").attr("id", "yAxisGroup").attr("transform", `translate(${margin.left}, ${margin.top})`)

const x = d3.scaleBand().range([0, width - margin.left - margin.right]).padding(0.1).domain([diCaprioBirthYear, today])
const xn = d3.scaleLinear().range([0, width - margin.left - margin.right]).domain([diCaprioBirthYear, today])
const yn = d3.scaleLinear().range([height - margin.top - margin.bottom, 0]).domain([0, ageToday])
const y = d3.scaleLinear().range([height - margin.bottom - margin.top, 0]).domain([0, ageToday])

const xAxis = d3.axisBottom().scale(x)
const yAxis = d3.axisLeft().scale(y).ticks(50)

//data dicaprio
const dicaprio = []
    for (let i = 1998; i <= today-4; i++) {
        dicaprio.push({year: i, age: age(i)})
    }

xn.domain(d3.extent(dicaprio.map(d=> d.year)))
yn.domain([0, ageToday])

//25 year limit
const line25 = d3.line()
   .x(d => xn(d.year))
   .y(d => yn(25))

   const line25Group = elementGroup.append("g")
   .attr("id", "line25Group")
   .datum(dicaprio)

line25Group.append("path")
   .attr("d", line25)
   .attr("stroke-width", "2px")
   .attr("stroke", "red")

line25Group.append("text")
   .text("25-year limit")
   .attr("x", (width - margin.left - margin.right)/2)
   .attr("y", yn(26))
   .attr("text-anchor", "middle")
   .style("font-size", "18px")
   .style("font-weight", "bold")

//data Leo
const line = d3.line(dicaprio)
    .x(d => xn(d.year))
    .y(d => yn(d.age))
elementGroup.append("path")
    .datum(dicaprio)
    .attr("d", line)
    .attr("stroke-width", "3px")
    .attr("stroke", "orange")

    // Axes girlfriend
d3.csv("data.csv").then(data => {
    data.map(d=> d.age = +d.age)
    data.map(d=> d.year = +d.year)
    data.map(d => {d.name = d.name.replace(" ", "")})
    console.log(data)

    //Scale domain:
    y.domain([0, d3.max([d3.max(data.map(d => d.age)), ageToday])])
    x.domain(data.map(d => d.year))

    //call axes:
    xAxisGroup.call(xAxis)
    yAxisGroup.call(yAxis)

    //Data binding:
    let elements = elementGroup.selectAll("rect").data(data)
    elements.enter().append("rect")
    .attr("class", d => "bar " + d.name)
        .attr("x", d=> x(d.year))
        .attr("y", d=> y(d.age))
        .attr("width",x.bandwidth())
        .attr("height", d => height - y(d.age) - margin.top - margin.bottom )

/*
    No he habilitado esta parte del codigo porque recargaba demasiado la grafica mostrando todos los nombres de las novias

    elements.enter().append("text")
        .attr("class", "bar-text")
        .attr("x", d => x(d.year) + x.bandwidth()/2)
        .attr("y", d => y(d.age) - 5)
        .text(d => d.name)
        .attr("text-anchor", "middle")
        .style("font-size", "12px")
*/

})

svg.append("text").text("1- Gisele Bündchen, 2- Bar Rafaeli, 3- Blake Lively, 4- Erin Heatherson, 5- Toni Garrn, 6- Kelly Rohrbach, 7- Nina Agdal, 8- Camila Morrone")
    .attr("x", width -120)
    .attr("y", height - 10)
    .style("text-anchor", "end")
    .style("font-size", "12px")
