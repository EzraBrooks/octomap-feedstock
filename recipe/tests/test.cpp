#include <octomap/OcTree.h>

int main() {
  octomap::OcTree tree(0.1);
  const octomap::point3d point(0.0F, 0.0F, 0.0F);
  tree.updateNode(point, true);
  return tree.search(point) != nullptr ? 0 : 1;
}
