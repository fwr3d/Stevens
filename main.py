import tkinter as tk
from tkinter import ttk, messagebox
import psycopg2

# DB connection
def connect():
    return psycopg2.connect(
        dbname="librarydb",
        user="postgres",
        password="4532",
        host="localhost",
        port="5432"
    )

# Fetch all libraries
def load_libraries():
    try:
        with connect() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT lib_name FROM Library ORDER BY lib_name")
                return [row[0] for row in cur.fetchall()]
    except Exception as e:
        messagebox.showerror("Database Error", str(e))
        return []

# Fetch books for a selected library
def load_books(lib_name):
    try:
        with connect() as conn:
            with conn.cursor() as cur:
                cur.execute("""
                    SELECT book_name, author_name 
                    FROM Book 
                    WHERE lib_name = %s
                """, (lib_name,))
                return cur.fetchall()
    except Exception as e:
        messagebox.showerror("Query Error", str(e))
        return []

# On select library
def on_library_selected(event):
    selected = lib_combo.get()
    if not selected:
        return
    books = load_books(selected)
    book_list.delete(*book_list.get_children())
    for book in books:
        book_list.insert("", "end", values=book)

# GUI Setup
root = tk.Tk()
root.title("Library System")
root.geometry("520x420")
root.resizable(False, False)

tk.Label(root, text="Select a Library:", font=("Segoe UI", 12)).pack(pady=10)

lib_combo = ttk.Combobox(root, state="readonly", width=50, font=("Segoe UI", 10))
lib_combo.pack()
libraries = load_libraries()
lib_combo['values'] = libraries
if libraries:
    lib_combo.current(0)
    on_library_selected(None)
else:
    messagebox.showwarning("No Libraries Found", "No libraries are available in the database.")
lib_combo.bind("<<ComboboxSelected>>", on_library_selected)

tk.Label(root, text="Books in Library:", font=("Segoe UI", 12)).pack(pady=10)

book_list = ttk.Treeview(root, columns=("Title", "Author"), show="headings", height=12)
book_list.heading("Title", text="Book Title")
book_list.heading("Author", text="Author")
book_list.column("Title", anchor="center", width=260)
book_list.column("Author", anchor="center", width=200)
book_list.pack(fill="both", expand=True, padx=10)

root.mainloop()
