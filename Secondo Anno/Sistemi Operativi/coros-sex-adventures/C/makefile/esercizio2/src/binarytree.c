#include <stdio.h>
#include <stdlib.h>

#include <utils.h>
#include <binarytree.h>

node_t *buildTree(node_t *t, long id, void *data)
{
    if (t == NULL)
    {
        CHECK_PTR_RETURN((t = (node_t *)malloc(sizeof(node_t))),
                         "malloc", NULL);
        t->id = id;
        t->data = data;
        t->left = NULL;
        t->right = NULL;
    }
    else
    {
        if (id < t->id)                             // elemento minore della radice
            t->left = buildTree(t->left, id, data); // percorro il sottoalbero sinistro
        else
            t->right = buildTree(t->right, id, data); // percorro il sottoalbero destro
    }
    return t;
}

void printInOrder(node_t *t, FILE *stream)
{
    if (t != NULL)
    {
        printInOrder(t->left, stream);
        fprintf(stream, "(%ld,%s) ", t->id, (char *)t->data);
        printInOrder(t->right, stream);
    }
}

node_t *getMin(node_t *t)
{
    if (t->left == NULL) // albero di sinistra vuoto
        return t;        // il minimo e' la radice
    return getMin(t->left);
}

node_t *getMax(node_t *t)
{
    if (t->right == NULL) // albero di destra vuoto
        return t;         // il massimo e' la radice
    return getMax(t->right);
}

node_t *searchId(long id, node_t *root)
{
    node_t *n = root;
    while (n != NULL && n->id != id)
    {
        if (id < n->id)
            n = n->left;
        else
            n = n->right;
    }
    return n ? n : NULL;
}