//Const:
const width = 800
const height = 600
const margin = {
    top: 50,
    bottom: 55,
    left: 40,
    right: 10
}

//Svg and grups:
const svg = d3.select("div#chart").append("svg").attr("width", width).attr("height", height)
const elementGroup = svg.append("g").attr("id", "elementGroup") .attr("transform", `translate(${margin.left}, ${margin.top})`)
const axisGroup = svg.append("g").attr("id", "axisGroup")
const xAxisGroup = axisGroup.append("g").attr("id", "xAxisGroup").attr("transform", `translate(${margin.left}, ${height - margin.bottom})`)
const yAxisGroup = axisGroup.append("g").attr("id", "yAxisGroup").attr("transform", `translate(${margin.left}, ${margin.top})`)

//Axis:
const x = d3.scaleBand().range([0, width - margin.left - margin.right]).padding(0.1)
const y = d3.scaleLinear().range([height - margin.bottom - margin.top, 0])

//Axes text:
const xlabel= elementGroup.append("text").text("Teams").attr("transform", `translate(${width -margin.right-130}, ${height - margin.bottom-margin.top +50})`)
    .style("font-weight", "bold").style("font-size", "25px")
const ylabel= elementGroup.append("text").text("Number of World Cups").attr("transform", `translate(${-30}, ${-20})`)
    .style("font-weight", "bold").style("font-size", "25px")

const xAxis = d3.axisBottom().scale(x)
const yAxis = d3.axisLeft().scale(y)

//Data:
d3.csv("WorldCup.csv").then(data => {
    let year= 2022
    updateGraph(year)

    // Get a reference to the year slider and year display elements:
    const yearSlider = document.getElementById("year-slider")
    const yearDisplay = document.getElementById("year-display")

    yearDisplay.innerHTML = year

    d3.select("#year-slider").on("input", function() {
        year = this.value
        updateGraph(year)

        // Add an event listener to the year slider:
        yearSlider.addEventListener("input", () => {

            // Update the year display with the current slider value:
            yearDisplay.innerHTML = yearSlider.value
        })
    })

    function updateGraph(year) {
        //Changes to number:
        data.map(d => {
            d.Year = +d.Year
        })

        //Group data function nest:
        let nest = d3.nest()
            .key(d => d.Winner)
            .entries(data.filter(d => d.Year <= year))
            .sort((a, b) => d3.descending(a.values.length, b.values.length))

        //console.log(nest)

        //Scale domain:
        x.domain(nest.map(d => d.key))
        y.domain([0, d3.max(nest.map(d=>d.values.length))])

       //Ticks axis y:
        yAxis.ticks(y.domain()[1])

       //call axes:
        xAxisGroup.call(xAxis)
        yAxisGroup.call(yAxis)

        //Remove Bars:
        d3.selectAll("rect").remove()

       //Data binding:
        let elements = elementGroup.selectAll("rect").data(nest)
        elements.enter().append("rect")
            .attr("class", "Winner")
            .attr("x", d => x(d.key))
            .attr("width", x.bandwidth())
            .attr("height", d => height - margin.top - margin.bottom - y(d.values.length))
            .attr("y", d => y(d.values.length))
    }
})