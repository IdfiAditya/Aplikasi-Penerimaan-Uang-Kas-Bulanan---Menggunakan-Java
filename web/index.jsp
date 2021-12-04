<%-- 
    Document   : index
    Created on : Dec 3, 2021, 2:52:52 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--compile file header.jsp-->
<%@include file="header.jsp" %>
<div onload="reload()">
    <section>
        <h1>Daftar Mahasiswa</h1>
        <div class="operasi">
            <button onclick="tambah()">Tambah Data</button>
            <form style="display:none" name="vinform">
                Pencarian &nbsp;
                <select class="kategori" name="kategori" onchange="kat(this.value)">
                </select>
                <input type="text" name="q" onkeyup="kat(document.vinform.kategori.value)">
            </form>
            <div style="clear: both;">
            </div>
        </div>
        <div id="amit" onchange="reload()">
            <table id="tabel">
                <thead>
                    <!-- Head table (Nama Field)-->
                    <tr>
                        <th width='10%'>Npm</th>
                        <th width='30%'>Nama</th>
                        <th width='20%'>Kelas</th>
                        <th width='20%'>Bulan</th>
                        <th width='20%'>Pembayaran</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- start web service invocation (Menampilkan Data-getSnack) --%>
                    <%
                    try 
                    {
                        client.kas.KasBulanan service = new client.kas.KasBulanan();
	client.kas.TugasKasJavaidfi port = service.getTugasKasJavaidfiPort();
                                                
                        java.util.List<java.lang.Object> resultMahasiswa = port.tampilMahasiswa();
                        for (int i = 0; i < resultMahasiswa.size(); i++)
                        {
                            out.print("<tr class='data' onclick='edit(event)'>");
                            out.println(resultMahasiswa.get(i));
                            out.print("</tr>");
                        }
                    } catch (Exception ex) {
                        // TODO handle custom exceptions here
                    }
                    %>
                    <%-- end web service invocation --%>
                </tbody>
            </table>
        </div>
    </section>
</div>
    <!-- MODAL BOX -->
    <div id="idModal" class="modal" onlcose="reload()">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h1 id="text"></h1>

            <form id="input" name="input" method="post" onsubmit="sendInfo(event);">
                <table>
                    <tr>
                        <td width="120px">Npm</td>
                        <td><input id="npm" name="npm" type="number" min="1" max="20" required></td>
                    </tr>
                    <tr>
                        <td>Nama</td>
                        <td><input name="nama" type="text" minlength="1" maxlength="20" required></td>
                    </tr>
                    <tr>
                        <td>Kelas</td>
                        <td><input name="kelas" id="kelas" type="text" minlength="1" maxlength="10" required></td>
                    </tr>
                    <tr>
                        <td>Bulan</td>
                        <td><input name="Bulan" id="bulan" type="text" minlength="1" maxlength="25" required></td>
                    </tr>
                    <tr>
                        <td>Pembayaran</td>
                        <td><input name="Pembayaran" id="pembayaran" type="text" minlength="1" maxlength="25" required></td>
                    </tr>
                </table>
                <div class="submit">
                    <input id="simpan" type="submit" value="Simpan" onkeyup="reload">
                    <input id="hapus" type="submit" value="Hapus" onkeyup="reload" onclick="act='hapus'">
                    <div style="clear: both;"></div>
                </div>
            </form>
        </div>
    </div>

    <!-- JAVASCRIPT -->
    <script>
        var modal = document.getElementById('idModal');
        var span = document.getElementsByClassName("close")[0];
        var act, cat;

        function kat(str){
            cat = str;
            sendInfo();
        }

        function sendInfo(e) {
            location.reload(true);
            var xhttp;
            var v = document.vinform.q.value;
            var npm = document.input.npm.value;
            var nama = document.input.nama.value;
            var kelas = document.input.kelas.value;
            var bulan = document.input.bulan.value;
            var pembayaran = document.input.pembayaran.value;

            if(cat == "undefined"){
                cat = "npm";
            }

            if(window.XMLHttpRequest){
                xhttp = new XMLHttpRequest();
            } else if(window.ActiveXObject){
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("amit").innerHTML = this.responseText;
                }
            };

            xhttp.open("POST", "proses.jsp", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("val="+v+"&npm="+npm+"&nama="+nama+"&kelas="+kelas+"&bulan="+bulan+"&pembayaran="+pembayaran
                    +"&act="+act);

            e.preventDefault();
            modal.style.display = "none";
            document.getElementById('input').reset();
        }

        function tambah() {
            act = "tambah";
            
            modal.style.display = "block";
            document.getElementById('npm').disabled = false;
            document.getElementById('text').innerHTML = "Tambah Data";
            document.getElementById('hapus').style.display = "none";
        }

        function edit(event) {
            var target = event.target.parentNode;
            act = "edit";
            
            modal.style.display = "block";
            document.getElementById('npm').disabled = true;
            document.getElementById('text').innerHTML = "Edit Data";
            document.getElementById('hapus').style.display = "block";

            document.input.npm.value = target.cells[0].innerHTML;
            document.input.nama.value = target.cells[1].innerHTML;
            document.input.kelas.value = target.cells[2].innerHTML;
            document.input.bulan.value = target.cells[3].innerHTML;
            document.input.pembayaran.value = target.cells[4].innerHTML;
        }

        span.onclick = function() {
            modal.style.display = "none";
            document.getElementById('input').reset();
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
                document.getElementById('input').reset();
            }
        }
        
        function reload(){
            window.top.location.href = "index.jsp"; 
        }
    </script>

<!--compile file footer.jsp-->
<%@include file="footer.jsp" %>
