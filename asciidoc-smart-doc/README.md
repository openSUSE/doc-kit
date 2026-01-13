# How to use these templates

This README gives you a short introduction to our template files and how to use them.


# Why these templates?

These templates act as a blueprint for topic-oriented writing in AsciiDoc.


# Using these templates

The templates in this directory are already contained in a directory structure that matches the one of a real project.
See the naming and directory conventions outlined below.

If you are starting a topic-based authoring project from scratch, you can just copy this directory tree and start adjusting file names (DC file, assembly and topics) and root IDs as outlined below.

Once you have named the files accordingly, integrate them into the article file.

Write the new content and adapt the IDs.

In a final step, add suitable metadata information to your article docinfo.adoc file.
Stick to the conventions outlined below.


# Templates for Smart Docs

We provide five different types of information units:

* `article.adoc`: Article (builds the actual "article" from the components listed below)
* `task.adoc`: Task (how to?)
* `concept.adoc`: Concept (what is?)
* `reference.adoc`: Reference (e.g., list of options, table with config files, default settings)
* `glue.adoc`: Combines texts or structures that do not fit into any of the other categories. 

Typical glue topics include the intro section to your article, the "For more information" and the "What's next" sections.
Also use glue topics to add an additional layer of navigation to your article.
This is outlined in the `glue.adoc` example file.


## Naming and directory conventions

When creating new articles and topics, please stick to the following conventions.
We keep separate directories for each topic type, for common files and articles.

* Article files:

      articles/<NAME>.adoc

* Concept, reference, task, glue files:

      concepts/<NAME>.adoc
      references/<NAME>.adoc
      tasks/<NAME>.adoc
      glues/<NAME>.adoc

* Common files (entities, gfdl, etc):

      common/<NAME>.adoc

* Any topic's name consists of the following elements that are explained below:

      <NAME> := <TOPIC>[-<SUBTOPIC]-<SNIPPET-TOPIC>-<TITLE>

### DC file naming conventions

The DC file name must match the article file's root ID.

### File naming conventions

Always start with the overarching topic.
In doing so, ensure that articles belonging to the same topic can be easily spotted by someone looking for existing articles.
If necessary, add a subtopic (append with `_`):

```
autoyast
systemd
systemd-timer
network
```

The second component for concept, reference, task, glue should be the topic of the snippet.
For tasks, use a verb in gerund.
For descriptive topics (concepts, references) opt for noun-based:

```
references/autoyast-partitioner-syntax.adoc
concepts/autoyast-control-file.adoc
tasks/systemd-timer-creating.adoc
tasks/systemd-timer-troubleshooting.adoc
concepts/network-ipv6-vs-ipv4.adoc
glues/systemd-timer-intro.adoc
glues/systemd-timer-whats-next.adoc
glues/systemd-timer-more-info.adoc
```

The second component of the article should be an abbreviated title.
As our articles are intended to address specific problems and tasks, use verbs in gerund here as well:

```
articles/systemd-timer-working-with.adoc
articles/autoyast-understanding-config-file.adoc
```


### Image naming conventions

Make sure your images can be associated with the topic they belong to.
Use a similar naming scheme for images that you use for topic files.


```
<NAME> := <TOPIC>[-<SUBTOPIC]-<SNIPPET-TOPIC>-<TITLE>
```

## Version info

We maintain a changelog (revision history) for each article.
Add an entry to the `revhistory` element of the article's `docinfo.xml` file whenever you have done substantial content updates to the article and ask for a rebuild and repost of said article.
Do not artificially bloat the changelog by entering every single commit. Also, provide concise and meaningful version information that the reader benefits from.
This information might one day end up being sent out to readers as update notifications on content they subscribed to.

## Metadata

After your article is done, add a metadata layer to the assembly file. 
Check the `docinfo.xml` file for XML syntax and possible values.
The following metadata types are currently supported:

* Internal
* SEO
* Search
* Publishing info
* Social media

### Internal 

1. Add maintainer info (e-mail address) to the `docinfo.xml`.
   Use this information to contact the original author, in case you want to reuse a piece and would like to start a conversation on changing the file.

1. Determine whether the article needs to be translated and add a list of languages.

### SEO

Add some search engine-related information to your file:

1. `title`- 29-55 characters
1. `description` - max. 150 characters

### Search

Add as much search-related data to your article as possible. Choose the appropriate tags:

* `productname`
* `productversion`
* `architecture`
* `category`

### Publishing info

Provide the reader with some guidance on the article's "age" (`updated`).

### Social media

Provide an ultra-short (55 chars) description (`social-descr`) of your doc to make sure it gets properly shared via Facebook and Twitter.
