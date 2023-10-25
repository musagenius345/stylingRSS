import express from 'express';
const app = express();
import RSS from 'rss';

app.set('view engine', 'pug');
app.set('views', './views');

const posts = [
    { title: 'Post 1', content: 'This is the content of post 1.' },
    { title: 'Post 2', content: 'This is the content of post 2.' }
];

app.get('/', (req, res) => {
    res.render('index', { posts });
});

// Generate RSS feed
app.get('/rss', (req, res) => {
    const feed = new RSS({
        title: 'My Blog RSS Feed',
        site_url: 'http://example.com',
        feed_url: 'http://example.com/rss',
    });

    posts.forEach(post => {
        feed.item({
            title: post.title,
            description: post.content,
            url: 'http://example.com/post/' + post.title,
        });
    });

    res.set('Content-Type', 'application/xml');
    res.send(feed.xml());
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
