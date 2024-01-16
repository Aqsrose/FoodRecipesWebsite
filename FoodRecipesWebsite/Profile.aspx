<%@ Page Title="" Language="C#" MasterPageFile="~/Blankpage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FoodRecipesWebsite.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="NewFolder/styleess.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Font Awesome/fontawesome-free-6.1.1-web/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="modal/edit.css?v=<?php echo time(); ?>">
    <title>Profile - Food Recipes</title>

    <style>
        .mainContainer {
            /* margin-top: 10em; */
            /* max-width: 90rem; */
            display: flex;
           
            /* border: 2px solid red; */
           margin-bottom:50px;
        }

        .profileContainer {
            /* max-width: 70rem; */
            /* display: flex;
            flex-direction: column;
            justify-content: center; */
            /* border: 2px solid green; */
            display: flex;
            gap: 12em;
            justify-content: space-evenly;
            align-items: center;
            margin: 0 auto;
            
        }

        .detailsContainer {
            /* width: 50%; */
            display: flex;
            flex-direction: column;
            /* align-items: center; */
            margin-right:200px;
            padding-right:800px;
            padding-top:100px;
            align-items: flex-start;
            gap: 2em;
        }

        .editContainer {
            
            display: flex;
            align-items: flex-start;
            flex-direction: column;
            gap: .3em;
        }

        .countContainer {
            /* display: flex; */
        }

        .profileImg {
            margin-top: 50px;
            width: 200px;
            height: 200px;
            border: 1px solid #ffd977;
            border-radius: 50px;
        }

        .nameHeading {
            font-weight: 400;
            font-family: 'Frank Ruhl Libre', serif;
            font-size: 1.2rem;
        }

        .emailPara {
            font-family: 'Roboto', sans-serif;
            font-size: 1.1rem;
        }

        .btn {
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
            width: 100%;
        }

        .btn:hover {
            cursor: pointer;
            background: rgb(143, 67, 29);
        }

        .countContainer {
            display: flex;
            gap: 3em;
        }

        .count {
            font-family: 'Roboto', sans-serif;
            font-size: .95rem;
        }


        /* login box styling */

        input[type="email"],
        input[type="text"] {
            font-size: 1rem;
            font-family: 'Roboto', sans-serif;
            font-weight: 400;
            padding-left: .875rem;
            border: 1px solid #cc754981;
            width: 300px;
            padding-block: .50em;
            outline: none;
            margin: .3em;
        }

        form>p {
            font-family: 'Roboto', sans-serif;
            margin: .4em;
        }

        form>.btn {
            border: none;
            outline: none;
            height: 40px;
            background-color: #ac4511 !important;
            color: #fff;
            font-size: 18px;
            border-radius: 20px;
            display: block;
            padding-inline: 5em;
            margin-bottom: .4em;
            margin-top: .8em;
            width: 100%;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            /* margin: 0 auto; */
            margin-left: 6em;
            gap: -1em;
        }

        .primaryHeading {
            margin-bottom: .2em;
            text-align: center;
            font-size: 3.5rem;
            text-transform: capitalize;
            font-family: 'Frank Ruhl Libre', serif;
            font-weight: 300;
        }

        .cardBottom {
            margin-block: 1em;
        }

        .super {
            background: linear-gradient(#f0f9f9, #f0f9f9 calc(100% - 15rem), #fff);
            margin-top: 2em;
            padding: 1.2em;
        }
        .form-block{
            padding: 2em;
            font-family: 'Roboto', sans-serif;
            display: flex;
            flex-direction: column;
            gap: .4em;
        }

        .imageLabel{
            display: block;
            /* text-align: center; */
        }
        input[type="file"]{
            display: block;
            text-align: center;
            margin: 0 auto;
        }
        select{
            font-size: 1rem;
            font-family: 'Roboto', sans-serif;
            font-weight: 400;
            padding-left: .875rem;
            border: 1px solid #cc754981;
            width: 300px;
            padding-block: .50em;
            outline: none;
            margin: .3em;
        }
        .caret{
            color: teal;
        }
        textarea{
            font-size: 1rem;
            font-family: 'Roboto', sans-serif;
            font-weight: 400;
            padding-left: .875rem;
            border: 1px solid #cc754981;
            width: 300px;
            padding-block: .50em;
            outline: none;
            margin: .3em;
            resize: none;
        }
        .imgUpload{
            width: 100%;
        }
        .mt{
            margin-top: .4em;
        }
    </style>
</head>
<body style="margin-top:20px">
    <navbar class="whitesmoke" >
    <div class="navContainer1">
        <a href="Index.aspx">
            <img src="Images/logo1.png" alt="logo" class="logo" /></a>
    </div>
    <div class="navContainer2">
        <a href="Index.aspx">Home</a>
        <a href="Contact.aspx"  runat="server">Contact</a>
        <a href="About us.aspx"  runat="server">About us</a>
        <a href="Logout.aspx" runat="server">Logout</a>

    </div>
</navbar>
    <div class="mainContainer">
        <div class="profileContainer">
            <div class="imgContainer">
                <asp:Image ID="profileImage" runat="server" class="profileImg" />
            </div>
        </div>
        <div class="detailsContainer">
            <div class="editContainer" >
                <asp:Label ID="usernameLabel" runat="server" class="nameHeading"></asp:Label>
                <div class="countContainer">
                    <p class="count">
                        uploaded recipe(s)
                    </p>
                    <p class="count">
                        bookmark(s)
                    </p>
                </div>
                <div class="btndiv">
                     <asp:Button ID="editProfileButton" runat="server" Text="Edit Profile" class="modal-btn btn" OnClick="submitBtn_Click" />
            </div>
                <asp:Button ID="Button1" runat="server" Text="Upload Recipe" class="modal-btn btn" OnClick="Button1_Click" />
                </div>
        </div>
   </div>
     <div id="recipeContainer" runat="server" class="cards">
    
 </div>
</body>
    </html>
</asp:Content>
