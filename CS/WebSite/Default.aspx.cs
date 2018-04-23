using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected string GetPreviewText(object fieldText, int previewLength) {
        string text = fieldText.ToString();
        if (previewLength > text.Length) previewLength = text.Length;
        return text.Substring(0, previewLength) + "...";
    }

    public string GetClientInstanceName(int index) {
        return "pc" + index.ToString();
    }
    public string GetClickHandler(int index) {
        return "function(s, e){ pc" + index.ToString() + ".ShowAtElement(e.htmlElement); }";
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
