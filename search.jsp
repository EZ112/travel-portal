<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Protal</title>
    <link rel="icon" href="assets/img/travelico.png" attr>
    <base href="http://localhost:8082/travel-portal/">
    <link rel="stylesheet" href="assets/css/search.css">
  </head>
  <body>
    <% String heading = "Where are you going ?";%>
    <% String tagline = "Ticket anywhre only at TravelProtal";%>
    <% String tagline2 = "Booking is faster, easier and cheaper";%>
    <div class="container">
      <div class="section"><%@ include file="_menutag.jsp"%>
      </div>
      <div class="section">
        <div class="ticketlist">
          <table>
            <tbody>
              <tr>
                <th> Airline</th>
                <th> From</th>
                <th> To</th>
                <th> Price</th>
                <td rowspan="2"> 
                  <form action="">
                    <button>+</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td> Garuda Indonesia</td>
                <td> 
                  <div class="fromDest">Jakarta</div>
                </td>
                <td> 
                  <div class="toDest">Jakarta</div>
                </td>
                <td> <b>Rp. </b>  120.000</td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="ticketlist">
          <table>
            <tbody>
              <tr>
                <th> Airline</th>
                <th> From</th>
                <th> To</th>
                <th> Price</th>
                <td rowspan="2"> 
                  <form action="">
                    <button>+</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td> Garuda Indonesia</td>
                <td> 
                  <div class="fromDest">Jakarta</div>
                </td>
                <td> 
                  <div class="toDest">Jakarta</div>
                </td>
                <td> <b>Rp. </b>  120.000</td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="ticketlist">
          <table>
            <tbody>
              <tr>
                <th> Airline</th>
                <th> From</th>
                <th> To</th>
                <th> Price</th>
                <td rowspan="2"> 
                  <form action="">
                    <button>+</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td> Garuda Indonesia</td>
                <td> 
                  <div class="fromDest">Jakarta</div>
                </td>
                <td> 
                  <div class="toDest">Jakarta</div>
                </td>
                <td> <b>Rp. </b>  120.000</td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="ticketlist">
          <table>
            <tbody>
              <tr>
                <th> Airline</th>
                <th> From</th>
                <th> To</th>
                <th> Price</th>
                <td rowspan="2"> 
                  <form action="">
                    <button>+</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td> Garuda Indonesia</td>
                <td> 
                  <div class="fromDest">Jakarta</div>
                </td>
                <td> 
                  <div class="toDest">Jakarta</div>
                </td>
                <td> <b>Rp. </b>  120.000</td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="ticketlist">
          <table>
            <tbody>
              <tr>
                <th> Airline</th>
                <th> From</th>
                <th> To</th>
                <th> Price</th>
                <td rowspan="2"> 
                  <form action="">
                    <button>+</button>
                  </form>
                </td>
              </tr>
              <tr>
                <td> Garuda Indonesia</td>
                <td> 
                  <div class="fromDest">Jakarta</div>
                </td>
                <td> 
                  <div class="toDest">Jakarta</div>
                </td>
                <td> <b>Rp. </b>  120.000</td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="section"><%@ include file="_footerol.jsp"%>
      </div>
    </div>
  </body>
  <script src="assets/javascript/index.js"></script>
</html>