let myLibrary = [];

function Book(title, author, pages, read) {
	this.title = title;
	this.author = author;
	this.pages = pages;
	this.read = read;
}

function addBookToLibrary(book) {
	myLibrary.push(book);
}

function render(obj) {
	var tbody = document.getElementById('tbody');
	// console.log('tbody: ', tbody)
	for(var i = 0; i < obj.length; i++) {
		var tr = '<tr>';

		tr += "<td>" + obj[i].title + '</td>';
		tr += "<td>" + obj[i].author + '</td>';
		tr += "<td>" + obj[i].pages + '</td>';
		tr += "<td>" + obj[i].read + '</td>';
		tr += '</tr>'

		tbody.innerHTML += tr;
	};
};

let hobbit = new Book('hobbit', 'tolkien', 300, false);
let potter = new Book('potter', 'rowling', 500, false);

addBookToLibrary(hobbit);
addBookToLibrary(potter);



render(myLibrary);

