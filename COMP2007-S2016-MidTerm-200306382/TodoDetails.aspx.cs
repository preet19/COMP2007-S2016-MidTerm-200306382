using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements required for EF DB access
using COMP2007_S2016_MidTerm_200306382.Models;
using System.Web.ModelBinding;


namespace COMP2007_S2016_MidTerm_200306382
{
    public partial class TodoDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                this.GetTodo();
            }
        }

        /**
         * <summary>
         * This method gets the todo data from the DB
         * </summary>
         * 
         * @method GetTodo
         * @returns {void}
         */

        protected void GetTodo()
        {
            // populate the form with existing data from the database
            int TodoID = Convert.ToInt32(Request.QueryString["TodoID"]);

            // connect to the EF DB
            using (TodoConnection db = new TodoConnection())
            {
                // populate a todo object instance with the todoID from the URL Parameter
                Todo updatedTodo = (from Todo in db.Todos
                                          where Todo.TodoID == TodoID
                                          select Todo).FirstOrDefault();

                // map the todo properties to the form controls
                if (updatedTodo != null)
                {
                    TodoNameTextBox.Text = updatedTodo.TodoName;
                    TodoNameTextBox.Text = updatedTodo.TodoNotes;
                    
                }
            }
        }

        /**
         * <summary>
         * This method redirect to default page
         * </summary>
         * 
         * @method CancelButton_Click
         * @returns {void}
         */

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            // Redirect back to todo page
            Response.Redirect("~/Default.aspx");
        }

        /**
      * <summary>
      * This method saves the data to database
      * </summary>
      * 
      * @method SaveButton_Click
      * @returns {void}
      */

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            // Use EF to connect to the server
            using (TodoConnection db = new TodoConnection())
            {
                // use the todo model to create a new todo object and
                // save a new record
                Todo newTodo = new Todo();

                int TodoID = 0;

                if (Request.QueryString.Count > 0) // our URL has a todoID in it
                {
                    // get the id from the URL
                    TodoID = Convert.ToInt32(Request.QueryString["TodoID"]);

                    // get the current todo from EF DB
                    newTodo = (from Todo in db.Todos
                                  where Todo.TodoID == TodoID
                                  select Todo).FirstOrDefault();
                }

                // add form data to the new todo record
                newTodo.TodoName = TodoNameTextBox.Text;
                newTodo.TodoNotes = NotesTextBox.Text;
                

                // use LINQ to ADO.NET to add / insert new todo into the database

                if (TodoID == 0)
                {
                    db.Todos.Add(newTodo);
                }


                // save our changes - also updates and inserts
                db.SaveChanges();

                // Redirect back to the updated todo page
                Response.Redirect("~/TodoList.aspx");
            }
        }
    }
}
