<%@ Page Title="" Language="C#" MasterPageFile="~/Blankpage.Master" AutoEventWireup="true" CodeBehind="UploadRecipe.aspx.cs" Inherits="FoodRecipesWebsite.UploadRecipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:GridView ID="UserData" runat="server"></asp:GridView>
      <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp - Food Recipes</title>
    <style>
        body{
            margin: 0;
            padding: 0;
            /* background: url(./img/loginImg.jpg); */
            font-family: sans-serif;
        }
        .loginbox{
            width: 400px;
            /* height: 475px; */
            background: white;
            border-radius: 20px;
            box-shadow: 0 0 15px 0 rgb(0 0 0 / 30%);
            color: black;
            top: 50%;
            left: 50%;
            position: absolute;
            transform: translate(-50%, -50%);
            box-sizing: border-box;
            padding: 70px 30px;
            transition: transform .5s;
        }

        .loginbox:hover{
            transform: translate(-50%, -51%);
        }

        h1{
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 22px;
        }

        .loginbox p{
            margin: 0;
            padding: 0;
            font-weight: bold;
        }

        .loginbox input{
            width: 100%;
            margin-bottom: 20px;
        }

        .loginbox input::placeholder{
          color: rgb(161, 161, 161);
        }

        .loginbox input[type = "email"],
        input[type="text"], 
        input[type = "password"]{
            border: none;
            border-bottom: 1px solid brown;
            background: transparent;
            outline: none;
            height: 40px;
            color: black;
            font-size: 14px;
        }

        .btn{
            border: none;
            outline: none;
            height: 40px;
            background-color: #ac4511;
            color: #fff;
            font-size: 18px;
            border-radius: 20px;
            display: block;
            padding-inline: 5em;
            margin-bottom: .4em;
        }

        .btn:hover{
            cursor: pointer;
            background: rgb(143, 67, 29);
        }

        .loginbox a{
            text-decoration: none;
            font-size: 12px;
            line-height: 20px;
            color: darkgray;
        }

        .loginbox a:hover{
            color: black;
        }
        .Message {
            color: Red;
            font-size: 0.8em;
            margin-top: -10px;
        }
        Description{
            margin-top:5px;
            margin-bottom:20px;
            width:340px;
        }
    </style>
</head>
<body>
    <div class="loginbox">
         <asp:Label ID="StatusLabel" runat="server"  EnableViewState="false"></asp:Label>
        <h2>Upload New Recipe</h2>
        <p>Choose recipe image</p><asp:FileUpload ID="ImageUpload" runat="server" />
        <p>Recipe Title</p>
        <asp:TextBox ID="TitleTextBox" runat="server" placeholder="Recipe Title" />
        <div class="Message">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server"
                ControlToValidate="TitleTextBox"
                Display="Dynamic"
                ErrorMessage="Please enter a recipe title."
            />
        </div>
        <p>Recipe Category</p>
        <asp:TextBox ID="CategoryTextBox" runat="server" placeholder="Recipe Category" />
        <div class="Message">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server"
                ControlToValidate="CategoryTextBox"
                Display="Dynamic"
                ErrorMessage="Please enter a recipe category."
            />
        </div>
        <p>Recipe Description</p>
        <asp:TextBox ID="DescriptionTextBox" runat="server" TextMode="MultiLine" Rows="8" placeholder="Recipe Description" class="Description"></asp:TextBox>
        <div class="Message">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDescription" runat="server"
                ControlToValidate="DescriptionTextBox"
                Display="Dynamic"
                ErrorMessage="Please enter a recipe description."
            />
        </div>
        <asp:Button ID="SubmitRecipeButton" runat="server" Text="Upload" class="btn" OnClick="SubmitRecipeButton_Click" />
    </div>
    </body>
</html>
</asp:Content>
