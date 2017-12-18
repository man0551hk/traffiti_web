using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Name.Attributes.Add("placeholder", (string)GetLocalResourceObject("Name"));
        Email.Attributes.Add("placeholder", (string)GetLocalResourceObject("Email"));
        Password.Attributes.Add("placeholder", (string)GetLocalResourceObject("Password"));
        ConfirmPassword.Attributes.Add("placeholder", (string)GetLocalResourceObject("ConfirmPassword"));
        SignUpBtn.Text = (string)GetLocalResourceObject("ok");

    }

    protected void SignUpBtn_Click(object sender, EventArgs e)
    {
        
    }
}