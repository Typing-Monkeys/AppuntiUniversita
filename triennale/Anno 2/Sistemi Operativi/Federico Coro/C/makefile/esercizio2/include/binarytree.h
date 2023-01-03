#ifndef __BINARYTREE_H__
#define __BINARYTREE_H__

/* struttura nodo dell'albero */
typedef struct node_t
{
    long id;
    void *data;
    struct node_t *left;
    struct node_t *right;
} node_t;

node_t *buildTree(node_t *root, long id, void *data);
void printInOrder(node_t *t, FILE *stream);
node_t *getMin(node_t *t);
node_t *getMax(node_t *t);
node_t *searchId(long id, node_t *root);

#endif