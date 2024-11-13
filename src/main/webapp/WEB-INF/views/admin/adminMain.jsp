<%--
  Created by IntelliJ IDEA.
  User: full5-6
  Date: 2024-11-13
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>Ela Admin - HTML5 Admin Template</title>
  <meta name="description" content="Ela Admin - HTML5 Admin Template" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png" />
  <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png" />

  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css"
  />
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
  />
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css"
  />
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css"
  />
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"
  />
  <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css"
  />
  <link
      rel="stylesheet"
      href="/resources/adminG/assets/css/cs-skin-elastic.css"
  />
  <link rel="stylesheet" href="/resources/adminG/assets/css/style.css" />
  <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
  <link
      href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
      rel="stylesheet"
  />
  <link
      href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
      rel="stylesheet"
  />

  <link
      href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css"
      rel="stylesheet"
  />
  <link
      href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css"
      rel="stylesheet"
  />

  <style>
    #weatherWidget .currentDesc {
      color: #ffffff !important;
    }
    .traffic-chart {
      min-height: 335px;
    }
    #flotPie1 {
      height: 150px;
    }
    #flotPie1 td {
      padding: 3px;
    }
    #flotPie1 table {
      top: 20px !important;
      right: -10px !important;
    }
    .chart-container {
      display: table;
      min-width: 270px;
      text-align: left;
      padding-top: 10px;
      padding-bottom: 10px;
    }
    #flotLine5 {
      height: 105px;
    }

    #flotBarChart {
      height: 150px;
    }
    #cellPaiChart {
      height: 160px;
    }

    /* 이건 안 넣을거 */
    /* 발바닥 시작 */

    .footerContainer {
      width: 100%;
      border-top: 1px solid #ddd;
      padding-top: 50px;
      padding-bottom: 50px;
      display: flex;
      justify-content: center;
    }

    .footerContent {
      display: flex;
      width: 1500px;
      justify-content: space-around;
    }

    .footerContent p {
      color: rgb(102, 102, 102);
      margin: 0;
    }

    .footerLink {
      padding-bottom: 10px;
      color: rgb(102, 102, 102);
    }

    .footerLink a {
      color: black;
      text-decoration: none;
    }

    .footerLink a {
      padding-left: 20px;
      padding-right: 20px;
    }

    #footerLogo {
      width: 129px;
      height: 33px;
    }

    .developerList a {
      text-decoration: none;
      color: rgb(102, 102, 102);
      cursor: pointer;
    }
    /* 발바닥 끝 */
  </style>
</head>

<body>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
  <nav class="navbar navbar-expand-sm navbar-default">
    <div id="main-menu" class="main-menu collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active">
          <a href="index.html"
          ><i class="menu-icon fa fa-laptop"></i>Dashboard
          </a>
        </li>
        <li class="menu-title">UI elements</li>
        <!-- /.menu-title -->

        <li class="menu-item-has-children dropdown">
          <a
              href="#"
              class="dropdown-toggle"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
          >
            <i class="menu-icon fa fa-table"></i>Management</a
          >
          <ul class="sub-menu children dropdown-menu">
            <li>
              <i class="fa fa-table"></i
              ><a href="tables-basic.html">Basic Table</a>
            </li>
            <li>
              <i class="fa fa-table"></i
              ><a href="tables-data.html">회원 관리</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </nav>
</aside>
<!-- /#left-panel -->
<!-- Right Panel -->
<div id="right-panel" class="right-panel">
  <!-- Header-->
  <header id="header" class="header">
    <div class="top-left">
      <div class="navbar-header">
        <a class="navbar-brand" href="./"
        ><img src="/resources/adminG/images/logo.png" alt="Logo"
        /></a>
        <a class="navbar-brand hidden" href="./"
        ><img src="/resources/adminG/images/logo2.png" alt="Logo"
        /></a>
        <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
      </div>
    </div>
    <div class="top-right">
      <div class="header-menu">
        <div class="user-area dropdown float-right">
          <a
              href="#"
              class="dropdown-toggle active"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
          >
            <img
                class="user-avatar rounded-circle"
                src="/resources/adminG/images/admin.jpg"
                alt="User Avatar"
            />
          </a>

          <div class="user-menu dropdown-menu">
            <a class="nav-link" href="#"
            ><i class="fa fa-power -off"></i>Logout</a
            >
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- /#header -->

  <!-- Content -->
  <div class="content">
    <!-- Animated -->
    <div class="animated fadeIn">
      <!-- Widgets  -->
      <div class="row">
        <div class="col-lg-3 col-md-6">
          <div class="card">
            <div class="card-body">
              <div class="stat-widget-five">
                <div class="stat-icon dib flat-color-1">
                  <i class="pe-7s-cash"></i>
                </div>
                <div class="stat-content">
                  <div class="text-left dib">
                    <div class="stat-text">
                      <span class="count">1975</span>원
                    </div>
                    <div class="stat-heading">시급</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="card">
            <div class="card-body">
              <div class="stat-widget-five">
                <div class="stat-icon dib flat-color-2">
                  <i class="pe-7s-cart"></i>
                </div>
                <div class="stat-content">
                  <div class="text-left dib">
                    <div class="stat-text">
                      <span class="count">3435</span>
                    </div>
                    <div class="stat-heading">상품 수</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="card">
            <div class="card-body">
              <div class="stat-widget-five">
                <div class="stat-icon dib flat-color-3">
                  <i class="pe-7s-browser"></i>
                </div>
                <div class="stat-content">
                  <div class="text-left dib">
                    <div class="stat-text">
                      <span class="count">144</span>시간
                    </div>
                    <div class="stat-heading">프로젝트 기간</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <div class="card">
            <div class="card-body">
              <div class="stat-widget-five">
                <div class="stat-icon dib flat-color-4">
                  <i class="pe-7s-users"></i>
                </div>
                <div class="stat-content">
                  <div class="text-left dib">
                    <div class="stat-text">
                      <span class="count">2986</span>
                    </div>
                    <div class="stat-heading">회원 수</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /Widgets -->
      <div>
        <!--  Traffic  -->
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h4 class="box-title">Traffic</h4>
              </div>
              <div class="row">
                <div class="col-lg-8">
                  <div class="card-body">
                    <!-- <canvas id="TrafficChart"></canvas>   -->
                    <div id="traffic-chart" class="traffic-chart"></div>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="card-body">
                    <div class="progress-box progress-1">
                      <h4 class="por-title">Visits</h4>
                      <div class="por-txt">96,930 Users (40%)</div>
                      <div class="progress mb-2" style="height: 5px">
                        <div
                            class="progress-bar bg-flat-color-1"
                            role="progressbar"
                            style="width: 40%"
                            aria-valuenow="25"
                            aria-valuemin="0"
                            aria-valuemax="100"
                        ></div>
                      </div>
                    </div>
                    <div class="progress-box progress-2">
                      <h4 class="por-title">Bounce Rate</h4>
                      <div class="por-txt">3,220 Users (24%)</div>
                      <div class="progress mb-2" style="height: 5px">
                        <div
                            class="progress-bar bg-flat-color-2"
                            role="progressbar"
                            style="width: 24%"
                            aria-valuenow="25"
                            aria-valuemin="0"
                            aria-valuemax="100"
                        ></div>
                      </div>
                    </div>
                    <div class="progress-box progress-2">
                      <h4 class="por-title">Unique Visitors</h4>
                      <div class="por-txt">29,658 Users (60%)</div>
                      <div class="progress mb-2" style="height: 5px">
                        <div
                            class="progress-bar bg-flat-color-3"
                            role="progressbar"
                            style="width: 60%"
                            aria-valuenow="60"
                            aria-valuemin="0"
                            aria-valuemax="100"
                        ></div>
                      </div>
                    </div>
                    <div class="progress-box progress-2">
                      <h4 class="por-title">Targeted Visitors</h4>
                      <div class="por-txt">99,658 Users (90%)</div>
                      <div class="progress mb-2" style="height: 5px">
                        <div
                            class="progress-bar bg-flat-color-4"
                            role="progressbar"
                            style="width: 90%"
                            aria-valuenow="90"
                            aria-valuemin="0"
                            aria-valuemax="100"
                        ></div>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-body -->
                </div>
              </div>
              <!-- /.row -->
              <div class="card-body"></div>
            </div>
          </div>
          <!-- /# column -->
        </div>
        <!--  /Traffic -->
        <div class="clearfix"></div>
        <!-- Orders -->
        <div class="orders">
          <div class="row">
            <div class="col-xl-8">
              <!-- Calender Chart Weather  -->
              <div class="row">
                <div class="col-md-12 col-lg-4">
                  <div class="card">
                    <div class="card-body">
                      <!-- <h4 class="box-title">Chandler</h4> -->
                      <div class="calender-cont widget-calender">
                        <div id="calendar"></div>
                      </div>
                    </div>
                  </div>
                  <!-- /.card -->
                </div>

                <div class="col-lg-8 col-md-6">
                  <div class="card ov-h">
                    <div class="card-body bg-flat-color-2">
                      <div
                          id="flotBarChart"
                          class="float-chart ml-4 mr-4"
                      ></div>
                    </div>
                    <div id="cellPaiChart" class="float-chart"></div>
                  </div>
                  <!-- /.card -->
                </div>
              </div>
              <!-- /Calender Chart Weather -->
            </div>
            <!-- /.col-lg-8 -->

            <div class="col-xl-4">
              <div class="row">
                <div class="col-lg-6 col-xl-12">
                  <div class="card br-0">
                    <div class="card-body">
                      <div class="chart-container ov-h">
                        <div id="flotPie1" class="float-chart"></div>
                      </div>
                    </div>
                  </div>
                  <!-- /.card -->
                </div>

                <div class="col-lg-6 col-xl-12">
                  <div class="card bg-flat-color-3">
                    <div class="card-body">
                      <h4 class="card-title m-0 white-color">
                        사용자 추세
                      </h4>
                    </div>
                    <div class="card-body">
                      <div id="flotLine5" class="flot-line"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.col-md-4 -->
          </div>
        </div>
      </div>
      <!-- /.orders -->

      <!-- Modal - Calendar - Add New Event -->
      <div class="modal fade none-border" id="event-modal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button
                  type="button"
                  class="close"
                  data-dismiss="modal"
                  aria-hidden="true"
              >
                &times;
              </button>
              <h4 class="modal-title"><strong>Add New Event</strong></h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
              <button
                  type="button"
                  class="btn btn-default waves-effect"
                  data-dismiss="modal"
              >
                Close
              </button>
              <button
                  type="button"
                  class="btn btn-success save-event waves-effect waves-light"
              >
                Create event
              </button>
              <button
                  type="button"
                  class="btn btn-danger delete-event waves-effect waves-light"
                  data-dismiss="modal"
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- /#event-modal -->
      <!-- Modal - Calendar - Add Category -->
      <div class="modal fade none-border" id="add-category">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button
                  type="button"
                  class="close"
                  data-dismiss="modal"
                  aria-hidden="true"
              >
                &times;
              </button>
              <h4 class="modal-title"><strong>Add a category </strong></h4>
            </div>
            <div class="modal-body">
              <form>
                <div class="row">
                  <div class="col-md-6">
                    <label class="control-label">Category Name</label>
                    <input
                        class="form-control form-white"
                        placeholder="Enter name"
                        type="text"
                        name="category-name"
                    />
                  </div>
                  <div class="col-md-6">
                    <label class="control-label"
                    >Choose Category Color</label
                    >
                    <select
                        class="form-control form-white"
                        data-placeholder="Choose a color..."
                        name="category-color"
                    >
                      <option value="success">Success</option>
                      <option value="danger">Danger</option>
                      <option value="info">Info</option>
                      <option value="pink">Pink</option>
                      <option value="primary">Primary</option>
                      <option value="warning">Warning</option>
                    </select>
                  </div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button
                  type="button"
                  class="btn btn-default waves-effect"
                  data-dismiss="modal"
              >
                Close
              </button>
              <button
                  type="button"
                  class="btn btn-danger waves-effect waves-light save-category"
                  data-dismiss="modal"
              >
                Save
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- /#add-category -->
    </div>
    <!-- .animated -->
  </div>
  <!-- /.content -->
  <div class="clearfix"></div>
  <!-- Footer -->
  <footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" charEncoding="UTF-8" />
  </footer>
  <!-- /.site-footer -->
</div>
<!-- /#right-panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="/resources/adminG/assets/js/main.js"></script>

<!--  Chart js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

<!--Chartist Chart-->
<script src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
<script src="/resources/adminG/assets/js/init/weather-init.js"></script>

<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
<script src="/resources/adminG/assets/js/init/fullcalendar-init.js"></script>

<!--Local Stuff-->
<script>
  jQuery(document).ready(function ($) {
    "use strict";

    // Pie chart flotPie1
    var piedata = [
      { label: "Desktop visits", data: [[1, 32]], color: "#5c6bc0" },
      { label: "Tab visits", data: [[1, 33]], color: "#ef5350" },
      { label: "Mobile visits", data: [[1, 35]], color: "#66bb6a" },
    ];

    $.plot("#flotPie1", piedata, {
      series: {
        pie: {
          show: true,
          radius: 1,
          innerRadius: 0.65,
          label: {
            show: true,
            radius: 2 / 3,
            threshold: 1,
          },
          stroke: {
            width: 0,
          },
        },
      },
      grid: {
        hoverable: true,
        clickable: true,
      },
    });
    // Pie chart flotPie1  End
    // cellPaiChart
    var cellPaiChart = [
      { label: "Direct Sell", data: [[1, 65]], color: "#5b83de" },
      { label: "Channel Sell", data: [[1, 35]], color: "#00bfa5" },
    ];
    $.plot("#cellPaiChart", cellPaiChart, {
      series: {
        pie: {
          show: true,
          stroke: {
            width: 0,
          },
        },
      },
      legend: {
        show: false,
      },
      grid: {
        hoverable: true,
        clickable: true,
      },
    });
    // cellPaiChart End
    // Line Chart  #flotLine5
    var newCust = [
      [0, 3],
      [1, 5],
      [2, 4],
      [3, 7],
      [4, 9],
      [5, 3],
      [6, 6],
      [7, 4],
      [8, 10],
    ];

    var plot = $.plot(
        $("#flotLine5"),
        [
          {
            data: newCust,
            label: "New Data Flow",
            color: "#fff",
          },
        ],
        {
          series: {
            lines: {
              show: true,
              lineColor: "#fff",
              lineWidth: 2,
            },
            points: {
              show: true,
              fill: true,
              fillColor: "#ffffff",
              symbol: "circle",
              radius: 3,
            },
            shadowSize: 0,
          },
          points: {
            show: true,
          },
          legend: {
            show: false,
          },
          grid: {
            show: false,
          },
        }
    );
    // Line Chart  #flotLine5 End
    // Traffic Chart using chartist
    if ($("#traffic-chart").length) {
      var chart = new Chartist.Line(
          "#traffic-chart",
          {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
            series: [
              [0, 18000, 35000, 25000, 22000, 0],
              [0, 33000, 15000, 20000, 15000, 300],
              [0, 15000, 28000, 15000, 30000, 5000],
            ],
          },
          {
            low: 0,
            showArea: true,
            showLine: false,
            showPoint: false,
            fullWidth: true,
            axisX: {
              showGrid: true,
            },
          }
      );

      chart.on("draw", function (data) {
        if (data.type === "line" || data.type === "area") {
          data.element.animate({
            d: {
              begin: 2000 * data.index,
              dur: 2000,
              from: data.path
              .clone()
              .scale(1, 0)
              .translate(0, data.chartRect.height())
              .stringify(),
              to: data.path.clone().stringify(),
              easing: Chartist.Svg.Easing.easeOutQuint,
            },
          });
        }
      });
    }
    // Traffic Chart using chartist End
    //Traffic chart chart-js
    if ($("#TrafficChart").length) {
      var ctx = document.getElementById("TrafficChart");
      ctx.height = 150;
      var myChart = new Chart(ctx, {
        type: "line",
        data: {
          labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
          datasets: [
            {
              label: "Visit",
              borderColor: "rgba(4, 73, 203,.09)",
              borderWidth: "1",
              backgroundColor: "rgba(4, 73, 203,.5)",
              data: [0, 2900, 5000, 3300, 6000, 3250, 0],
            },
            {
              label: "Bounce",
              borderColor: "rgba(245, 23, 66, 0.9)",
              borderWidth: "1",
              backgroundColor: "rgba(245, 23, 66,.5)",
              pointHighlightStroke: "rgba(245, 23, 66,.5)",
              data: [0, 4200, 4500, 1600, 4200, 1500, 4000],
            },
            {
              label: "Targeted",
              borderColor: "rgba(40, 169, 46, 0.9)",
              borderWidth: "1",
              backgroundColor: "rgba(40, 169, 46, .5)",
              pointHighlightStroke: "rgba(40, 169, 46,.5)",
              data: [1000, 5200, 3600, 2600, 4200, 5300, 0],
            },
          ],
        },
        options: {
          responsive: true,
          tooltips: {
            mode: "index",
            intersect: false,
          },
          hover: {
            mode: "nearest",
            intersect: true,
          },
        },
      });
    }
    //Traffic chart chart-js  End
    // Bar Chart #flotBarChart
    $.plot(
        "#flotBarChart",
        [
          {
            data: [
              [0, 18],
              [2, 8],
              [4, 5],
              [6, 13],
              [8, 5],
              [10, 7],
              [12, 4],
              [14, 6],
              [16, 15],
              [18, 9],
              [20, 17],
              [22, 7],
              [24, 4],
              [26, 9],
              [28, 11],
            ],
            bars: {
              show: true,
              lineWidth: 0,
              fillColor: "#ffffff8a",
            },
          },
        ],
        {
          grid: {
            show: false,
          },
        }
    );
    // Bar Chart #flotBarChart End
  });
</script>
</body>
</html>
