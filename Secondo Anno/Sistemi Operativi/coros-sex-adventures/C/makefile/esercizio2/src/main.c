#include <stdlib.h>
#include <stdio.h>

#include <utils.h>
#include <binarytree.h>

int main(int argc, char *argv[])
{
    if (argc == 1)
    {
        fprintf(stderr, "usa: %s id [ids]\n", argv[0]);
        return -1;
    }

    node_t *root = NULL;

    root = buildTree(root, 5, "A");
    root = buildTree(root, 2, "B");
    root = buildTree(root, 3, "C");
    root = buildTree(root, 1, "D");
    root = buildTree(root, 4, "E");

#if defined(DEBUG)
    printInOrder(root, stdout);
    printf("\n");
    printf("Min: %s\n", (char *)getMin(root)->data);
    printf("Max: %ld\n", (getMax(root))->id);
#endif

    for (int i = 1; i < argc; ++i)
    {
        node_t *t = searchId(atoi(argv[i]), root);
        if (t != NULL)
        {
            printf("%ld trovato %s\n", t->id, (char *)t->data);
        }
        else
        {
            printf("%s non trovato\n", argv[i]);
        }
    }

    return 0;
}