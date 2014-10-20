# Naming Conventions for Directories

## Proposal: Keep the names of directories:

- Short
- Simple
- Precise
- Lowercase
- One word
- Non-abbreviated

Also:

- Don't repeat FIBO in the name, it's all FIBO
- Make the structure more hierarchical, for instance all document directories under documents, all model directories
  under models, all image directories under images and so forth.
- If the "one word" rule is too strict, separate multiple words with dashes, so not `Source Models` but `source-models`.

## So that it is easier to:

- Create (Jenkins-) scripts that assume certain directory names

   Especially working with spaces in the name can cause issues. But also typo's remembering which letters were
   uppercase and which were not (which matters in Linux) could be prevented.

- Understand the directory structure

   Forcing yourself to come up with precise names rather than long sentences will most likely lead to a
   more organized result.
