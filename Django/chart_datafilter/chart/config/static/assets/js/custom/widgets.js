"use strict";
var KTWidgets = {
    init: function(month, venus_p1, venus_a1, venus_i1, wacoal_p1, wacoal_a1, wacoal_i1, solb_p1, solb_a1, solb_i1) {
        var e, t, a, o, s, r, i, l, n, c, d, h;
        ! function() {
            if (document.querySelector("#kt_dashboard_daterangepicker")) {
                var e = $("#kt_dashboard_daterangepicker"),
                    t = moment(),
                    a = moment();
                e.daterangepicker({
                    direction: KTUtil.isRTL(),
                    startDate: t,
                    endDate: a,
                    opens: "left",
                    applyClass: "btn-primary",
                    cancelClass: "btn-light-primary",
                    ranges: {
                        Today: [moment(), moment()],
                        Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
                        "Last 7 Days": [moment().subtract(6, "days"), moment()],
                        "Last 30 Days": [moment().subtract(29, "days"), moment()],
                        "This Month": [moment().startOf("month"), moment().endOf("month")],
                        "Last Month": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
                    }
                }, o), o(t, a, "")
            }

            function o(e, t, a) {
                var o = "",
                    s = "";
                t - e < 100 || "Today" == a ? (o = "Today:", s = e.format("MMM D")) : "Yesterday" == a ? (o = "Yesterday:", s = e.format("MMM D")) : s = e.format("MMM D") + " - " + t.format("MMM D"), $("#kt_dashboard_daterangepicker_date").html(s), $("#kt_dashboard_daterangepicker_title").html(o)
            }
        }(), (e = document.querySelector("#kt_user_menu_dark_mode_toggle")) && e.addEventListener("click", (function() {
                window.location.href = this.getAttribute("data-kt-url")
            })), t = document.querySelectorAll(".statistics-widget-3-chart"), [].slice.call(t).map((function(e) {
                var t = parseInt(KTUtil.css(e, "height"));
                if (e) {
                    var a = e.getAttribute("data-kt-chart-color"),
                        o = KTUtil.getCssVariableValue("--bs-gray-800"),
                        s = KTUtil.getCssVariableValue("--bs-" + a),
                        r = KTUtil.getCssVariableValue("--bs-light-" + a);
                    new ApexCharts(e, {
                        series: [{
                            name: "Net Profit",
                            data: [30, 45, 32, 70, 40]
                        }],
                        chart: {
                            fontFamily: "inherit",
                            type: "area",
                            height: t,
                            toolbar: {
                                show: !1
                            },
                            zoom: {
                                enabled: !1
                            },
                            sparkline: {
                                enabled: !0
                            }
                        },
                        plotOptions: {},
                        legend: {
                            show: !1
                        },
                        dataLabels: {
                            enabled: !1
                        },
                        fill: {
                            type: "solid",
                            opacity: .3
                        },
                        stroke: {
                            curve: "smooth",
                            show: !0,
                            width: 3,
                            colors: [s]
                        },
                        xaxis: {
                            categories: ["Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                            axisBorder: {
                                show: !1
                            },
                            axisTicks: {
                                show: !1
                            },
                            labels: {
                                show: !1,
                                style: {
                                    colors: o,
                                    fontSize: "12px"
                                }
                            },
                            crosshairs: {
                                show: !1,
                                position: "front",
                                stroke: {
                                    color: "#E4E6EF",
                                    width: 1,
                                    dashArray: 3
                                }
                            },
                            tooltip: {
                                enabled: !0,
                                formatter: void 0,
                                offsetY: 0,
                                style: {
                                    fontSize: "12px"
                                }
                            }
                        },
                        yaxis: {
                            min: 0,
                            max: 80,
                            labels: {
                                show: !1,
                                style: {
                                    colors: o,
                                    fontSize: "12px"
                                }
                            }
                        },
                        states: {
                            normal: {
                                filter: {
                                    type: "none",
                                    value: 0
                                }
                            },
                            hover: {
                                filter: {
                                    type: "none",
                                    value: 0
                                }
                            },
                            active: {
                                allowMultipleDataPointsSelection: !1,
                                filter: {
                                    type: "none",
                                    value: 0
                                }
                            }
                        },
                        tooltip: {
                            style: {
                                fontSize: "12px"
                            },
                            y: {
                                formatter: function(e) {
                                    return "$" + e + " thousands"
                                }
                            }
                        },
                        colors: [s],
                        markers: {
                            colors: [s],
                            strokeColor: [r],
                            strokeWidth: 3
                        }
                    }).render()
                }
            })),
function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-10-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "생산량",
                data: venus_p1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}(),
function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-11-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "실판매",
                data: venus_a1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}(),
            function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-12-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "재고금액",
                data: venus_i1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}(),
            function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-13-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "생산량",
                data: wacoal_p1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}(),
            function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-14-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "실판매",
                data: wacoal_a1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}(),
            function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-15-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "재고금액",
                data: wacoal_i1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}(),
            function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-16-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "생산량",
                data: solb_p1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}(),
            function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-17-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "실판매",
                data: solb_a1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}(),
            function() {
    var e, t, a, o = document.querySelectorAll(".mixed-widget-18-chart"),
        s = KTUtil.getCssVariableValue("--bs-gray-500"),
        r = KTUtil.getCssVariableValue("--bs-gray-200"),
        i = KTUtil.getCssVariableValue("--bs-gray-300");
    [].slice.call(o).map((function(o) {
        e = o.getAttribute("data-kt-color"), t = parseInt(KTUtil.css(o, "height")), a = KTUtil.getCssVariableValue("--bs-" + e), new ApexCharts(o, {
            series: [{
                name: "재고금액",
                data: solb_i1.splice(2)
            }],
            chart: {
                fontFamily: "inherit",
                type: "bar",
                height: t,
                toolbar: {
                    show: !1
                }
            },
            plotOptions: {
                bar: {
                    horizontal: !1,
                    columnWidth: ["50%"],
                    borderRadius: 4
                }
            },
            legend: {
                show: !1
            },
            dataLabels: {
                enabled: !1
            },
            stroke: {
                show: !0,
                width: 2,
                colors: ["transparent"]
            },
            xaxis: {
                categories: month,
                axisBorder: {
                    show: !1
                },
                axisTicks: {
                    show: !1
                },
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            yaxis: {
                show: false, // Set show property to false to remove y-axis labels
                y: 0,
                offsetX: 0,
                offsetY: 0,
                labels: {
                    style: {
                        colors: s,
                        fontSize: "12px"
                    }
                }
            },
            fill: {
                type: "solid"
            },
            states: {
                normal: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                hover: {
                    filter: {
                        type: "none",
                        value: 0
                    }
                },
                active: {
                    allowMultipleDataPointsSelection: !1,
                    filter: {
                        type: "none",
                        value: 0
                    }
                }
            },
            tooltip: {
                style: {
                    fontSize: "12px"
                },
                y: {
                    formatter: function(e) {
                        return numberWithCommas(e)
                    }
                }
            },
            colors: [a, i],
            grid: {
                padding: {
                    top: 10
                },
                borderColor: r,
                strokeDashArray: 4,
                yaxis: {
                    lines: {
                        show: !0
                    }
                }
            }
        }).render()
    }))
}()

    }
};