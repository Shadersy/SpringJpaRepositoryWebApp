<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset=utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>MAIN PAGE</title>
</head>



<body>


<br>
<br>
<br>
<br>
<br>
<br>
<br>



<button type="button" style="margin-left: 580px" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
    Show all houses
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Show all houses</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <th>address</th>
                        <th>indication</th>
                    </tr>
                    <#list allHouses as house>
                        <tr>
                            <td>${house.getAddress()}</td>
                            <td>${house.getIndication()}</td>
                        </tr>
                    </#list>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<br>
<br>




<button type="button" style="margin-left: 590px" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter3">
    Delete house
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Delete house</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">



                <form method="post" action="/deleteHouse">
                    <br>



                    <select class="custom-select"  name="deleteHouse">
                        <#list allHouses as house>
                            <option value="${house.id}">${house.address}</option>
                        </#list>
                    </select>
                    <br>
                    <br>
                    <button type="submit" style="margin-left: 170px" class="btn btn-primary">Delete House</button>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
<br>
<br>



<button type="button" style="margin-left: 590px" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter2">
    Create house
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Create house</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/createHouse">
                    <br>
                    <div class="input-group input-group-sm mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-sm">Enter the address</span>
                        </div>
                        <input type="text" name="address" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                    </div>
                    <button type="submit" style="margin-left: 180px" class="btn btn-primary">Create house</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<br>
<br>

<button type="button" style="margin-left: 590px" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter4">
    Set indication
</button>

<div class="modal fade" id="exampleModalCenter4" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Set indication</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/createMeter">
                    <br>
                    <select class="custom-select" name="createMeter">
                        <#list allHouses as house>
                            <option value="${house.id}">${house.address}</option>
                        </#list>
                    </select>
                    <br>
                    <br>
                    <div class="input-group input-group-sm mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-sm">Indication</span>
                        </div>
                        <input type="number" name="valueOfMeter" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">



                    </div>


                    <button type="submit" style="margin-left: 170px" class="btn btn-primary">Set indication</button>
                </form>

                <#if error??>
                    ${error}

                <#else>

                </#if>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<br>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>


</html>