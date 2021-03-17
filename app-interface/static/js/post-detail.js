
let activePost;
let activeComments;

// gets post from the server:
const getPost = () => {
    // get post id from url address:
    const url = window.location.href;
    id = url.substring(url.lastIndexOf('#') + 1);

    // fetch post:
    fetch('/api/posts/' + id + '/')
        .then(response => response.json())
        .then(data => {
            console.log(data);
            activePost = data;
            renderPost();
        });
};

// updates the post:
const updatePost = (ev) => {
    const data = {
        title: document.querySelector('#title').value,
        content: document.querySelector('#content').value,
        author: document.querySelector('#author').value
    };
    console.log(data);
    fetch('/api/posts/' + activePost.id + '/', { 
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(data => {
            activePost = data;
            renderPost();
            showConfirmation();
        });
    
    // this line overrides the default form functionality:
    ev.preventDefault();
};

const deletePost = (ev) => {
    const doIt = confirm('Are you sure you want to delete this blog post?');
    if (!doIt) {
        return;
    }
    fetch('/api/posts/' + activePost.id + '/', { 
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        }
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);
        // navigate back to main page:
        window.location.href = '/';
    });
    ev.preventDefault()
};

// creates the HTML to display the post:
const renderPost = (ev) => {
    const paragraphs = '<p>' + activePost.content.split('\n').join('</p><p>') + '</p>';
    const template = `
        <p id="confirmation" class="hide"></p>
        <h1>${activePost.title}</h1>
        <div class="date">${formatDate(activePost.published)}</div>
        <div class="content">${paragraphs}</div>
        <p>
            <strong>Author: </strong>${activePost.author}
        </p>
    `;
    document.querySelector('.post').innerHTML = template;
    toggleVisibility('view');

    // prevent built-in form submission:
    if (ev) { ev.preventDefault(); }
};

// creates the HTML to display the editable form:
const renderForm = () => {
    const htmlSnippet = `
        <div class="input-section">
            <label for="title">Title</label>
            <input type="text" name="title" id="title" value="${activePost.title}">
        </div>
        <div class="input-section">
            <label for="author">Author</label>
            <input type="text" name="author" id="author" value="${activePost.author}">
        </div>
        <div class="input-section">
            <label for="content">Content</label>
            <textarea name="content" id="content">${activePost.content}</textarea>
        </div>
        <button class="btn btn-main" id="save" type="submit">Save</button>
        <button class="btn" id="cancel" type="submit">Cancel</button>
    `;

    // after you've updated the DOM, add the event handlers:
    document.querySelector('#post-form').innerHTML = htmlSnippet;
    document.querySelector('#save').onclick = updatePost;
    document.querySelector('#cancel').onclick = renderPost;
    toggleVisibility('edit');
};

const formatDate = (date) => {
    const options = { 
        weekday: 'long', year: 'numeric', 
        month: 'long', day: 'numeric' 
    };
    return new Date(date).toLocaleDateString('en-US', options); 
};

// handles what is visible and what is invisible on the page:
const toggleVisibility = (mode) => {
    if (mode === 'view') {
        document.querySelector('#view-post').classList.remove('hide');
        document.querySelector('#menu').classList.remove('hide');
        document.querySelector('#post-form').classList.add('hide');
    } else {
        document.querySelector('#view-post').classList.add('hide');
        document.querySelector('#menu').classList.add('hide');
        document.querySelector('#post-form').classList.remove('hide');
    }
};

const showConfirmation = () => {
    document.querySelector('#confirmation').classList.remove('hide');
    document.querySelector('#confirmation').innerHTML = 'Post successfully saved.';
};

const showCommentConfirmation = () => {
    document.querySelector('#confirmation').classList.remove('hide');
    document.querySelector('#confirmation').innerHTML = 'Comment added!';
};


// Comments

// gets comments from the server:
const getComments = () => {
    // get post id from url address:
    const url = window.location.href;
    id = url.substring(url.lastIndexOf('#') + 1);

    // fetch post:
    fetch('/api/comments')
        .then(response => response.json())
        .then(data => {
            activeComments = [];
            for (i = 0; i < data.length; i++) {
                if (data[i].post.$oid == id || data[i].post.id == id) {
                    activeComments.push(data[i]);
                }
            }
            renderComments();
        });
};

// creates the HTML to display the comments
const renderComments = (ev) => {
    template = ''
    for (i = 0; i < activeComments.length; i++) {
        template += `
            <div style="background-color:#f6eeff;padding:0.7em;margin-bottom:0.5em;">
            <button style="float:right;" onclick="deleteComment('${activeComments[i]._id.$oid}');">Delete</button>
            <p>
                ${activeComments[i].comment}
            </p>
            <p>
                <b>Author: </b>
                ${activeComments[i].author}
            </p>
            </div>
        `;
    }
    document.querySelector('.comments').innerHTML = template;
    toggleVisibility('view');

    // prevent built-in form submission:
    if (ev) { ev.preventDefault(); }
};

const hideCommentForm = () => {
    document.querySelector('#comment-form').classList.add('hide');
    document.querySelector('#comment-button').classList.remove('hide');
}

// creates the HTML to display the editable form:
const renderCommentForm = () => {
    const htmlSnippet = `
        <div>
            <textarea style="width:100%;height:8em;" type="text" name="title" id="comment-text"></textarea>
        </div>
        <button class="btn btn-main" id="save-comment" type="submit">Save</button>
        <button class="btn" id="cancel-comment" type="submit">Cancel</button>
    `;

    // after you've updated the DOM, add the event handlers:
    document.querySelector('#comment-form').innerHTML = htmlSnippet;
    document.querySelector('#save-comment').onclick = postComment;
    document.querySelector('#cancel-comment').onclick = hideCommentForm;
    document.querySelector('#comment-form').classList.remove('hide');
    document.querySelector('#comment-button').classList.add('hide');
};

// Adds the commment
const postComment = (ev) => {
    const data = {
        post: activePost,
        comment: document.querySelector('#comment-text').value,
        author: "Karl 'Energy is Free' Friston"
        
    };
    console.log(data);
    fetch('/api/comments', { 
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(data => {
            activePost = data;
            document.querySelector('#comment-form').classList.add('hide');
        document.querySelector('#comment-button').classList.remove('hide');
            document.querySelector('.comments').innerHTML = "";
            getComments();
            renderComments();
            showCommentConfirmation();
        });
    // this line overrides the default form functionality:
    ev.preventDefault();
};

const deleteComment = (commentId) => {
    const doIt = confirm('Are you sure you want to delete this comment?');
    if (!doIt) {
        return;
    }
    fetch('/api/comments/' + commentId, { 
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        }
    })
    .then(response => response.json())
    .then(data => {
        document.querySelector('.comments').innerHTML = "";
        getComments();
        renderComments();
    });
};

// called when the page loads:
const initializePage = () => {
    // get the post from the server:
    getPost();
    // add button event handler (right-hand corner:
    document.querySelector('#edit-button').onclick = renderForm;
    document.querySelector('#delete-button').onclick = deletePost;

    // get comments
    getComments();
    
    // add button event handler (right-hand corner:
    document.querySelector('#comment-button').onclick = renderCommentForm;
};

initializePage();