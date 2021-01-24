
<%@ Page Language="C#" Debug="true" Culture="Auto" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Drawing" %>

<script runat="server">

    string sqlMeme;
    private string fileLoc;
    void Page_Load(object s, EventArgs e)
    {
        /*     String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
               "Data Source=" + Server.MapPath("Storage.accdb") + ";";
            OleDbConnection cn = new OleDbConnection(cs);
            OleDbCommand cmd;
            OleDbDataReader r;
            String h;
            cmd = new OleDbCommand("SELECT * FROM Meme;", cn);
            cn.Open();
            r = cmd.ExecuteReader();
            h = "";
            while (r.Read())
            {
                h = h + r["Picture"];
                image7.Src = h;
            }
            cn.Close(); */

    }


    void uploadImage_Click(object s, EventArgs e)
    {


        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
           "Data Source=" + Server.MapPath("Storage.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);
        OleDbCommand cmd;

        sqlMeme = "UPDATE [Meme] " +
                     " SET [Picture] = '" + imageAddress.Value + "'" +
         " WHERE id = " + Request.QueryString["id"] + "1";
        cmd = new OleDbCommand(sqlMeme, cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();


        OleDbDataReader r;
        String h;
        cmd = new OleDbCommand("SELECT * FROM Meme;", cn);
        cn.Open();
        r = cmd.ExecuteReader();
        h = "";
        while (r.Read())
        {
            h = h + r["Picture"];
            image7.Src = h;

        }

        cn.Close();

    }

    public void image7_Click(object s, EventArgs e)
    {
        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
           "Data Source=" + Server.MapPath("Storage.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);
        OleDbCommand cmd;
        OleDbDataReader r;
        String h;
       
        cmd = new OleDbCommand("SELECT * FROM Meme;", cn);
        cn.Open();
        r = cmd.ExecuteReader();
        h = "";
        while (r.Read())
        {
            h = h + r["Picture"];
            fileLoc = h.ToString();

        }
        cn.Close();


        ProcessStartInfo startInfo = new ProcessStartInfo(fileLoc.ToString());
        startInfo.Verb="edit";
        Process.Start(startInfo);


    }


</script>


<html>
<head>
    <title>Meme Generator</title>
</head>
<body>
    <form runat="server">
    <center> 
     <font size="7">MEME MAKER</font>
   
        <p>
            <input type="image" id="image1" runat="server" src="template-drake-hotline-bling.jpg" width="250" height="250" />
                   <span style="display:inline-block; width:100px ;"></span>
            <input type="image" id="image2" runat="server" src="Leo meme template.jpg" width="250" height="250" />
                   <span style="display:inline-block; width:100px ;"></span>
            <input type="image" id="image3" runat="server" src="Spongebob template.jpg" width="250" height="250" />
        </p>
        <p>
             <input type="image" id="image4" runat="server" src="Gravity template.jpg" width="250" height="250" />
            <span style="display:inline-block; width:100px ;"></span>
            <input type="image" id="image5" runat="server" src="simpsontemp.jpg" width="250" height="250" />
            <span style="display:inline-block; width:100px ;"></span>
            <input type="image" id="image6" runat="server" src="spiderman temp.jpg" width="250" height="250" />       
            <p>
                 <input type="image" id="image7" runat="server"  width="250" height="250" src="" onserverclick="image7_Click"/>
             
            </p>

        </p>
        <p>
            

            <legend> Upload Image </legend>
            <label for="Image">Image</label>
            <input type="file" name="Image" runat ="server" id="imageAddress" />
            <br />
            <input type="submit" value="Upload" id="uploadImage" runat="server" onServerClick="uploadImage_Click"/>
            
        </p>
    </center>

</form>
</body>
</html>
