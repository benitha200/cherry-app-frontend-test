import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { report } from "./../../../../apis/qualityReport.js";
export const GetReport = (id) => {
  const { isPending, error, data } = useQuery({
    queryKey: ["Report"],
    queryFn: async () => await report(),
  });
  return { isPending, error, data };
};
