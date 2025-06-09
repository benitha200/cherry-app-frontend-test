import { DerivalyTable } from "./components/report.jsx";
import { ReportsHeading } from "../../../../sharedCompoents/heading.jsx";

export default function DeliveryTracks() {
  return (
    <div>
      <ReportsHeading>Delivery</ReportsHeading>
      <DerivalyTable />
    </div>
  );
}
