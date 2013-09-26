using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            WebReference.WebService1 obj = new WebReference.WebService1();
            double a = Convert.ToDouble(TextBox1.Text);
            double b = Convert.ToDouble(TextBox2.Text);
            TextBox3.Text = Convert.ToString(obj.add(a, b));
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            WebReference.WebService1 obj = new WebReference.WebService1();
            double a = Convert.ToDouble(TextBox1.Text);
            double b = Convert.ToDouble(TextBox2.Text);
            TextBox3.Text = Convert.ToString(obj.sub(a, b));
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            WebReference.WebService1 obj = new WebReference.WebService1();
            double a = Convert.ToDouble(TextBox1.Text);
            double b = Convert.ToDouble(TextBox2.Text);
            TextBox3.Text = Convert.ToString(obj.mul(a, b));
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            WebReference.WebService1 obj = new WebReference.WebService1();
            double a = Convert.ToDouble(TextBox1.Text);
            double b = Convert.ToDouble(TextBox2.Text);
            TextBox3.Text = Convert.ToString(obj.div(a, b));
        }
    }
}