<%-- 
    Document   : proses
    Created on : Dec 3, 2021, 2:53:00 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div onchange="reload()">
<%-- start web service invocation --%>
<% 
    try 
    {
	String act = request.getParameter("act");
        
        client.kas.KasBulanan service = new client.kas.KasBulanan();
	client.kas.TugasKasJavaidfi port = service.getTugasKasJavaidfiPort();
        
        //If Statement  untuk Proses CRUD
        if(act.equals("tambah")) //Proses Tambah Snack
        {
            try 
            {
                int npm = Integer.valueOf(request.getParameter("npm"));
                java.lang.String nama = request.getParameter("nama");
                java.lang.String kelas = request.getParameter("kelas");
                java.lang.String bulan = request.getParameter("bulan");
                java.lang.String pembayaran = request.getParameter("pembayaran");
                port.addMahasiswa(npm, nama, kelas, bulan, pembayaran);

                response.sendRedirect("index.jsp");
            }
            catch(Exception e){}
        }
        else if(act.equals("edit") ) //Proses Edit Snack
        {
            try 
            {
                int npm = Integer.valueOf(request.getParameter("npm"));
                java.lang.String nama = request.getParameter("nama");
                java.lang.String kelas = request.getParameter("kelas");
                java.lang.String bulan = request.getParameter("bulan");
                java.lang.String pembayaran = request.getParameter("pembayaran");
                port.editMahasiswa(npm, nama, kelas, bulan, pembayaran);

                response.sendRedirect("index.jsp");
            }
            catch(Exception e){}
        } 
        else if(act.equals("hapus")) //Proses Hapus Snack
        {
            try 
            {
                int npm = Integer.valueOf(request.getParameter("npm")); 
                port.delMahasiswa(npm);

                response.sendRedirect("index.jsp");
            }
            catch(Exception e){}
        }
        //Selesai If Statement untuk Proses CRUD
    }
    catch (Exception ex) 
    {
	{ out.print("<p style='font-size:20px; font-weight:bold; color:red;'>Gagal koneksi ke server!</p>"); }
    }
%>
</div>
<script>
    function reload()
    {
        location.reload(true);
    }
</script>
<%-- end web service invocation --%>