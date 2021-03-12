
<%@ Page Language="C#" Debug="true" Culture="Auto" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Windows.Forms" %>



<script runat="server">
    string sqlMeme;
    private string fileLoc;

    bool PopUpWindow;
    string imageLoc;


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
    public void image1_Click(object s, EventArgs e)
    {
        ProcessStartInfo startInfo = new ProcessStartInfo("C:\\Users\\James\\COMP1004fin\\WebSite1\\template-drake-hotline-bling.jpg");
        startInfo.Verb = "edit";
        Process.Start(startInfo);
    }
    public void image2_Click(object s, EventArgs e)
    {
        ProcessStartInfo startInfo = new ProcessStartInfo("C:\\Users\\James\\COMP1004fin\\WebSite1\\Leo meme template.jpg");
        startInfo.Verb = "edit";
        Process.Start(startInfo);
    }
    public void image3_Click(object s, EventArgs e)
    {
        ProcessStartInfo startInfo = new ProcessStartInfo("C:\\Users\\James\\COMP1004fin\\WebSite1\\Spongebob template.jpg");
        startInfo.Verb = "edit";
        Process.Start(startInfo);
    }
    public void image4_Click(object s, EventArgs e)
    {
        ProcessStartInfo startInfo = new ProcessStartInfo("C:\\Users\\James\\COMP1004fin\\WebSite1\\Gravity template.jpg");
        startInfo.Verb = "edit";
        Process.Start(startInfo);
    }
    public void image5_Click(object s, EventArgs e)
    {
        ProcessStartInfo startInfo = new ProcessStartInfo("C:\\Users\\James\\COMP1004fin\\WebSite1\\simpsontemp.jpg");
        startInfo.Verb = "edit";
        Process.Start(startInfo);
    }
    public void image6_Click(object s, EventArgs e)
    {
        ProcessStartInfo startInfo = new ProcessStartInfo("C:\\Users\\James\\COMP1004fin\\WebSite1\\spiderman temp.jpg");
        startInfo.Verb = "edit";
        Process.Start(startInfo);
    }
    public void image7_Click(object s, EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please save any changes')", true);
        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
           "Data Source=" + Server.MapPath("Storage.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);
        OleDbCommand cmd;
        OleDbDataReader r;
        String h;
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('When you are finished editing save your work, if you used save as you will need to reupload the image, otherwise refresh the page')", true);
        PopUpWindow = true;
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
        startInfo.Verb = "edit";
        Process.Start(startInfo);

        // MessageBox.Show("Press Ok When done");
    }



</script>


<html>
<head>
    <title>Meme Maker</title>
</head>
    <style>
        body{
          background-color: #E0E0E0
        }
    </style>
<body>
    <form runat="server">
    <center> 
     <font size="7">THE MEME MAKER</font>
   
        <p>
            <input type="image" id="image1" runat="server" src="template-drake-hotline-bling.jpg" width="250" height="250" onserverclick="image1_Click" />
                   <span style="display:inline-block; width:100px ;"></span>
            <input type="image" id="image2" runat="server" src="Leo meme template.jpg" width="250" height="250" onserverclick="image2_Click" />
                   <span style="display:inline-block; width:100px ;"></span>
            <input type="image" id="image3" runat="server" src="Spongebob template.jpg" width="250" height="250" onserverclick="image3_Click" />
        </p>
        <p>
             <input type="image" id="image4" runat="server" src="Gravity template.jpg" width="250" height="250" onserverclick="image4_Click" />
            <span style="display:inline-block; width:100px ;"></span>
            <input type="image" id="image5" runat="server" src="simpsontemp.jpg" width="250" height="250" onserverclick="image5_Click" />
            <span style="display:inline-block; width:100px ;"></span>
            <input type="image" id="image6" runat="server" src="spiderman temp.jpg" width="250" height="250" onserverclick ="image6_Click"/>       
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
        <font size ="6">How to use the Meme Generator</font>
        <p></p>
        <font size="5">Step One: Select a picture you would like to edit, or upload your own one</font>
        <p></p>
        <font size="5">Step Two: Click on the picture & its will open your default editing software </font>
        <p></p>
        <font size="5"> Step Three: Edit your photo and make sure to save it </font>
        <p></p>
        <font size="5"> Step Four:Finished! if you saved over the original image you will need to refresh the page to see it </font>
</form>
</body>
</html>
